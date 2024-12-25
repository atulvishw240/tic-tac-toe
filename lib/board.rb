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

  def play
    i = 0
    while i < 9
      make_move(current_player)
      break if won?(current_player)

      switch_players!
      i += 1
    end

    winning_message(current_player)
    draw
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
    move = gets.chomp.split(" ")
    update_board(player, move)
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
  def draw
    return unless no_of_turns == 9

    puts "The Game ended in Draw!!"
  end

  def won?(player)
    col_match?(player) || row_match?(player) || diagonal_match?(player)
  end

  def winning_message(player)
    "#{player.name} won the Game!!"
  end
end
