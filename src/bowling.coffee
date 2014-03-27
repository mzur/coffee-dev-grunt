'use strict'

class Game
	_rolls: []
	_currentRoll: 0

	_isSpare: (frameIndex) -> @_rolls[frameIndex] + @_rolls[frameIndex + 1] is 10

	_isStrike: (frameIndex) -> @_rolls[frameIndex] is 10

	roll: (pinsDown) -> @_rolls[@_currentRoll++] = pinsDown

	score: ->
		score = 0

		frameIndex = 0
		for frame in [0...10]
			score += @_rolls[frameIndex] + @_rolls[frameIndex + 1]
			if @_isSpare(frameIndex) or @_isStrike(frameIndex)
				score += @_rolls[frameIndex + 2]

			frameIndex-- if @_isStrike frameIndex
			frameIndex += 2

		score
