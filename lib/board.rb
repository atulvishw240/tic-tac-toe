# Create our board for game
class Board
  private attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def cell_empty?(position)
    board[position.row][position.col].nil?
  end

  def cell_value(position)
    board[position.row][position.col]
  end

  def full?
    board.flatten.none?(&:nil?)
  end

  def rows
    board
  end

  def columns
    board.transpose
  end

  def diagonals # rubocop:disable Metrics/AbcSize
    [
      [board[0][0], board[1][1], board[2][2]],
      [board[0][2], board[1][1], board[2][0]]
    ]
  end

  def display
    puts "    0   1   2  "
    board.each_with_index do |row, row_index|
      puts "  -------------"
      print "#{row_index} "
      row.each_index do |col_index|
        print "| #{@board[row_index][col_index]} "
      end

      print "|\n"
    end

    puts "  -------------"
  end

  def update(position, marker)
    board[position.row][position.col] = marker
  end
end
