require_relative "board"
require_relative "player"

player1 = Player.new("Atul", "X")
player2 = Player.new("Gaurav", "O")
board = Board.new(player1, player2)

board.display
board.play