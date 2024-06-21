# Create our board for game
class Board
  # -------------
  # | X | X | X |
  # -------------
  # | 0 | 0 | X |
  # -------------
  # | X | 0 | X |
  # -------------

  # This method displays board
  attr_accessor :board, :player1, :player2

  def initialize(player1, player2)
    @board = Array.new(3) { Array.new(3, " ") }
    @player1 = player1
    @player2 = player2
  end

  def display
    @board.each_with_index do |element, row|
      puts "-------------"
      element.each_with_index do |_elem, col|
        print "| #{@board[row][col]} "
      end

      print "|\n"
    end

    puts "-------------"
  end

  def make_move(player)
    puts "Enter row: "
    row = gets.chomp.to_i
    puts "Enter col: "
    col = gets.chomp.to_i
    self.board[row][col] = player.symbol
  end
end