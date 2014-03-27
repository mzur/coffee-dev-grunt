# coffee-dev

This is a small setup for developing a CoffeeScript application with TDD using [Grunt](http://gruntjs.com/) and [Karma](http://karma-runner.github.io/0.12/index.html) with the [Jasmine](http://jasmine.github.io/) testing framework.

## Requirements

To use this setup you need to have `node` and `npm` installed. Optionally you can install `grunt-cli` and `karma-cli` globally by using the command

```
npm install -g grunt-cli karma-cli
```

## Installation

Just get the contents of this repository and run `npm install` in the directory to have everything set up.

## Usage

In this setup you will find two directories, `src/` and `test-src/`. The `src/` directory is for the source code of your application. The `test-src/` directory is for the Jasmine unit tests.

When you start developing your application, you have to start up the Karma server for running the tests first:

```
karma start
```

This will launch Firefox as test runner by default.

### Developement

Run `grunt watch` for developing your application. This will watch all files in `src/` and `test-src/` and compile them on any change to `dev/` or `test/` respectively. After that all tests are run.

The files are not uglified or concatenated so you can debug your code easily.

### Testing

Run `grunt test` to compile and test your application just once.

### Distribution

Run `grunt` for distributing your application. All CoffeeScript files will be compiled and all tests will be run. If the tests pass, your application files are concatenated and put in a single JavaScript file in the `dist/` directory. Finally an uglified version of the application file is created.

## Example

This repository contains the [Bowling Game Kata](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata) as an example. Just look at the files and try the commands described in **Usage** :-)
