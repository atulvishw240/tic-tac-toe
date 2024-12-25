# Create our board for game
class Board
  attr_accessor :board, :current_player_id, :no_of_turns

  def initialize(player1, player2)
    @board = Array.new(3) { Array.new(3, " ") }
    @players = [player1, player2]
    @current_player_id = 0
    @no_of_turns = 0

    puts "#{player1.name} is #{player1.symbol} and #{player2.name} is #{player2.symbol} "
  end

  def play(player1, player2)
    i = 0
    move = make_move(player1)
    update_board(player1, move)
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

  def current_player
    @players[current_player_id]
  end

  def switch_players!
    self.current_player_id -= 1
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

  def make_move(player)
    self.no_of_turns += 1

    puts "It's #{player.name} turn"
    print "Enter your move in the form (row col): "
    gets.chomp.split(" ")
  end

  def update_board(player, move)
    row = move[0]
    col = move[1]
    board[row][col] = player.symbol
    display
  end

  def row_match?(player)
    board.any? do |row|
      row.all? { |marker| marker == player.symbol }
    end
  end

  # Checks col to see our winning condition
  def col_match?(player)
    col_index = 0
    while col_index < 3
      row_index = 0
      counter = 0
      while row_index < 3
        counter += 1 if board[row_index][col_index] == player.symbol

        i += 1
      end

      return true if counter == 3

      col_index += 1
    end
  end

  # Checks diagonals to see our winning conditon
  def diagonal_match?(player)
    diagonal_winning_moves = [[[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]]

    diagonal_winning_moves.any? do |diagonal|
      diagonal.all? do |coord|
        row_index = coord[0]
        col_index = coord[1]
        board[row_index][col_index] == player.marker
      end
    end
  end

  # displays losing message
  def lost
    return unless no_of_turns == 9

    puts "The Game ended in Draw!!"
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
end
