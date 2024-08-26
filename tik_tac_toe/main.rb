require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

game = Game.new(Board.new, Player.new("X"), Player.new("O"))

game.start_game
