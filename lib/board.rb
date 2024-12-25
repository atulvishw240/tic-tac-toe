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
      move = current_player.make_move
      update_board(current_player, move)
      if won?(current_player)
        winning_message(current_player)
        break
      end

      switch_players!
      i += 1
    end

    draw
  end

  def current_player
    @players[current_player_id]
  end

  def switch_players!
    self.current_player_id = 1 - current_player_id
  end

  def update_board(player, move)
    row = move[0].to_i
    col = move[1].to_i
    board[row][col] = player.symbol
    self.no_of_turns += 1
    display
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

  def row_match?(player)
    board.any? do |row|
      row.all? { |marker| marker == player.symbol }
    end
  end

  def col_match?(player)
    col_index = 0
    while col_index < 3
      row_index = 0
      counter = 0
      while row_index < 3
        counter += 1 if board[row_index][col_index] == player.symbol

        row_index += 1
      end

      return true if counter == 3

      col_index += 1
    end
  end

  def diagonal_match?(player)
    diagonal_winning_moves = [[[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]]

    diagonal_winning_moves.any? do |diagonal|
      diagonal.all? do |coord|
        row_index = coord[0]
        col_index = coord[1]
        board[row_index][col_index] == player.symbol
      end
    end
  end

  def draw
    return unless no_of_turns == 9

    puts "The Game ended in Draw!!"
  end

  def won?(player)
    col_match?(player) || row_match?(player) || diagonal_match?(player)
  end

  def winning_message(player)
    puts "#{player.name} won the Game!!"
  end
end
