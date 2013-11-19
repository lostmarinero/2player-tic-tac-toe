class GameState

  attr_accessor :current_game

  attr_reader :available_moves, :current_turn

  def initialize(game)
    self.current_game = game
    @available_moves = game.open_spaces
    @current_turn = game.current_player_turn
  end

  def next_move(current_turn)

  end

end