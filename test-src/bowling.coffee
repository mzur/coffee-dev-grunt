'use strict'

describe 'the bowling game kata', ->

	describe 'the Game class', ->
		g = null

		beforeEach ->
			g = new Game()

		rollMany = (n, pins) ->	g.roll pins for i in [0...n]

		rollSpare = -> rollMany 2, 5

		it 'should give a correct score for all 0 pins', ->
			rollMany 20, 0
			expect(g.score()).toEqual 0

		it 'should give a correct score for all 1 pins', ->
			rollMany 20, 1
			expect(g.score()).toEqual 20

		it 'should give a correct score for one spare', ->
			rollSpare()
			g.roll 3
			rollMany 17, 0
			expect(g.score()).toEqual 16

		it 'should give a correct score for one strike', ->
			g.roll 10
			g.roll 3
			g.roll 4
			rollMany 16, 0
			expect(g.score()).toEqual 24

		it 'should give a correct score for a perfect game', ->
			rollMany 12, 10
			expect(g.score()).toEqual 300
			