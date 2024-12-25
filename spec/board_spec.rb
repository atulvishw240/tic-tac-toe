require_relative "../lib/board"
require_relative "../lib/player"

describe Board do
  describe "#current_player" do
    it "returns the current player id" do
      player1 = Player.new("Player1", "X")
      player2 = Player.new("Player2", "O")
      board = Board.new(player1, player2)

      expect(board.current_player_id).to eql(0)
    end
  end

  describe "#switch_players!" do
    it "returns the player id of opponent" do
      player1 = Player.new("Player1", "X")
      player2 = Player.new("Player2", "O")
      board = Board.new(player1, player2)

      expect(board.switch_players!).to eql(1)
    end
  end
end