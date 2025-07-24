require_relative "../lib/position"

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
    valid_move = move.all? { |index| index.between?(0, 2) }
    make_move unless valid_move

    Position.new(move[0], move[1])
  end
end
