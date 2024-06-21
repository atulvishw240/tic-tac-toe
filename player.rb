# Create Player for our game
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  # move method for player to make a move
  # def make_move
  #   puts "Enter row: "
  #   row = gets.chomp.to_i
  #   puts "Enter col: "
  #   col = gets.chomp.to_i
  #   @board[row][col] = self.symbol
  # end
end
