# Create Player for our game
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def make_move
    puts "It's #{name} turn"
    print "Enter your move in the form (row col): "
    gets.chomp.split(" ")
  end
end
