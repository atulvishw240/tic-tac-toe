require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

player1 = Player.new("Player1", "X")
player2 = Player.new("Player2", "O")
board = Board.new
game = Game.new(player1, player2, board)

game.play
