# Create our board for game
class Board
  @@no_of_turns = 0

  attr_accessor :board, :player1, :player2

  def initialize(player1, player2)
    @board = Array.new(3) { Array.new(3, " ") }
    @player1 = player1
    @player2 = player2
  end

  def display
    puts "    0   1   2  "
    @board.each_with_index do |element, row|
      puts "  -------------"
      print "#{row} "
      element.each_with_index do |_elem, col|
        print "| #{@board[row][col]} "
      end

      print "|\n"
    end

    puts "  -------------"
  end

  def make_move(player)
    puts "Enter row: "
    row = gets.chomp.to_i
    puts "Enter col: "
    col = gets.chomp.to_i
    board[row][col] = player.symbol
    display
    @@no_of_turns += 1
    who_won(player)
  end

  # Checks row to see our winning condition
  def check_row(player)
    i = 0 # Keep track of rows
    while i < 3
      j = 0 # Keep track of the column
      counter = 0 # When counter == 3 on a single row you have won
      while j < 3
        counter += 1 if board[i][j] == player.symbol
        j += 1
      end

      return true if counter == 3

      i += 1
    end
  end

  # Checks col to see our winning condition
  def check_col(player)
    j = 0
    while j < 3
      i = 0
      counter = 0
      while i < 3
        counter += 1 if board[i][j] == player.symbol

        i += 1
      end

      return true if counter == 3

      j += 1
    end
  end

  # Checks diagonals to see our winning conditon
  def check_diagonal(player)
    if (board[0][0] == player.symbol && board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
       (board[0][2] == player.symbol && board[0][2] == board[1][1] && board[1][1] == board[2][0])

      true
    end
  end

  # displays losing message
  def lost
    return unless @@no_of_turns == 9

    puts "Draw!!"
  end

  def who_won(player)
    # 1. Check for each row
    # 2. Check for each column
    # 3. Check for diagonals
    check_col(player) || check_row(player) || check_diagonal(player)
  end

  def message(player)
    puts "#{player.name} won the Game!!"
  end

  def play
    i = 0
    make_move(player1)
    while i < 4
      make_move(player2)
      if who_won(player2)
        message(player2)
        break
      end

      make_move(player1)
      if who_won(player1)
        message(player1)
        break
      end
      i += 1
    end

    lost
  end
end
