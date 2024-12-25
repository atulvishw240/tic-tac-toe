require_relative './lib/board'
require_relative './lib/player'

player1 = Player.new("Player1", "X")
player2 = Player.new("Player2", "O")
board = Board.new(player1, player2)

board.display
board.play(player1, player2)
