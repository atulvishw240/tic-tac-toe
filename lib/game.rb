# Game Layer
class Game
  attr_accessor :current_player_id, :board

  def initialize(player1, player2, board)
    @players = [player1, player2]
    @board = board
    @current_player_id = 0
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
end
