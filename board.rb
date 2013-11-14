class Board

  attr_accessor :spaces

  def initialize
    @spaces = make_spaces
  end

  def make_spaces
    board = {}
    9.times {|x| board[x + 1] = nil }
    board
  end

end
