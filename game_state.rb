class GameState

  attr_accessor :current_game, :board_state

  attr_reader :current_turn

  def initialize(game)
    self.current_game = game
    @current_turn = game.current_player_turn
  end

  def board_state
    current_game.board
  end

  def available_moves
    current_game.open_spaces
  end

  def next_move
    current_game.set_player(available_moves.first, 1)
  end

end