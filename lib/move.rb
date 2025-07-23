# Represent a Move
class Move
  attr_accessor :row, :col

  def initialize(row_index, col_index)
    @row = row_index
    @col = col_index
  end
end
