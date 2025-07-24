# Game Layer
class Game
  attr_accessor :current_player_id, :board

  def initialize(player1, player2, board)
    @players = [player1, player2]
    @board = board
    @current_player_id = 0
  end

  def play
    loop do
      board.display
      move = current_player.make_move
      board.update(move, current_player.symbol)

      if won?(current_player)
        puts "#{current_player.name} won the game!"
        return
      elsif board.full?
        puts "The game ended in draw!"
        return
      end

      switch_players!
    end
  end

  def current_player
    @players[current_player_id]
  end

  def opponent_player
    @players[1 - current_player_id]
  end

  def switch_players!
    self.current_player_id = 1 - current_player_id
  end

  def won?(player)
    # Check rows
    check_row = board.rows.any? do |row|
      row.all? { |marker| marker == player.symbol }
    end

    check_col = board.columns.any? do |col|
      col.all? { |marker| marker == player.symbol }
    end

    check_diag = board.diagonals.any? do |diag|
      diag.all? { |marker| marker == player.symbol }
    end

    check_row || check_col || check_diag
  end
end
