require_relative('board')
require_relative('player')

class Game
  attr_reader :players, :board

  def initialize(player1, player2)
    @board = Board.new
    @players = [Player.new(player1), Player.new(player2)]
  end





end