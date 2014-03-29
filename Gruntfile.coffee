module.exports = (grunt) ->
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		path:
			test: 'test-src/**/*.coffee'
			src: 'src/**/*.coffee'
		
		dest: 
			dist: 'dist/<%= pkg.name %>.js'
			dev: 'dev/'
			test: 'test/'

		coffee:
			dist:
				files: '<%= dest.dist %>' : ['<%= path.src %>']
			dev:
				src: '<%= path.src %>'
				dest: '<%= dest.dev %>'
				options:
					bare: yes
				expand: yes
				flatten: yes
				ext: '.js'
			test:
				src: '<%= path.test %>'
				dest: '<%= dest.test %>'
				options:
					bare: yes
				expand: yes
				flatten: yes
				ext: '.js'

		clean:
			dist: [
				'<%= dest.dist %>'
				'dist/<%= pkg.name %>.min.js'
			]
			dev: ['<%= dest.dev %>']
			test: ['<%= dest.test %>']

		uglify:
			options:
				banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
			dist:
				files:
					'dist/<%= pkg.name %>.min.js' : ['<%= dest.dist %>']

		karma:
			unit:
				configFile: 'karma.conf.js'
				background: yes
			continuous:
				configFile: 'karma.conf.js'
				singleRun: yes
				browsers: ['PhantomJS']

		coffee_jshint:
			files: ['Gruntfile.coffee', '<%= path.src %>', '<%= path.test %>']
			options:
				globals: [
					'module'
					'console'
					'document'
					'describe'
					'it'
					'before'
					'beforeEach'
					'after'
					'afterEach'
				]

		watch:
			files: ['<%= coffee_jshint.files %>']
			tasks: [
				#'coffee_jshint'
				'clean:dev'
				'coffee:dev'
				'clean:test'
				'coffee:test'
				'karma:unit:run'
			]

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-coffee-jshint'
	grunt.loadNpmTasks 'grunt-karma'
	grunt.loadNpmTasks 'grunt-contrib-watch'

	grunt.registerTask 'test', [
		'clean'
		#'coffee_jshint'
		'coffee:dev'
		'coffee:test'
		'karma:continuous'
	]

	grunt.registerTask 'default', ['test', 'coffee:dist', 'uglify']
