require_relative('board')
require_relative('player')

class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @board = Board.new
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @winner = nil
  end



end