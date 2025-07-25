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
    make_move unless valid_move?(move)

    Position.new(move[0], move[1])
  end

  private

  def valid_move?(move)
    move.all? { |index| index.between?(0, 2) }
  end
end
