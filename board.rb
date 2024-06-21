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

  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
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
end

board = Board.new
board.display
