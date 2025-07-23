require_relative "../lib/move"

# Create Player for our game
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def make_move
    print "Enter your move in the form (row,col): "
    move = gets.chomp.split(",").map(&:to_i)
    Move.new(move[0], move[1])
  end
end
