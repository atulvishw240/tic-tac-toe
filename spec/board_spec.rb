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

  describe "#update_board" do
    it "updates the board with player's move" do
      player1 = Player.new("Player1", "X")
      player2 = Player.new("Player2", "O")
      board = Board.new(player1, player2)
      board.update_board(player1, [1, 1])

      expect(board.board[1][1]).to eql("X")
    end
  end

  describe "#row_match?" do
    it "returns true if a row contains same player marker" do
      player1 = Player.new("Player1", "X")
      player2 = Player.new("Player2", "O")
      board = Board.new(player1, player2)

      board.update_board(player1, [0, 0])
      board.update_board(player1, [0, 1])
      board.update_board(player1, [0, 2])

      expect(board.row_match?(player1)).to eql(true)
    end
  end

  describe "#col_match?" do
    it "returns true if a row contains same player marker" do
      player1 = Player.new("Player1", "X")
      player2 = Player.new("Player2", "O")
      board = Board.new(player1, player2)

      board.update_board(player1, [0, 0])
      board.update_board(player1, [1, 0])
      board.update_board(player1, [2, 0])

      expect(board.col_match?(player1)).to eql(true)
    end
  end

  describe "#diagonal_match?" do
    it "returns true if a row contains same player marker" do
      player1 = Player.new("Player1", "X")
      player2 = Player.new("Player2", "O")
      board = Board.new(player1, player2)

      board.update_board(player1, [0, 0])
      board.update_board(player1, [1, 1])
      board.update_board(player1, [2, 2])

      expect(board.diagonal_match?(player1)).to eql(true)
    end
  end
end
