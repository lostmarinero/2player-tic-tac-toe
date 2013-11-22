class GameState

  attr_accessor :current_game, :board_state, :winning_move

  attr_reader :current_turn

  def initialize(game)
    self.current_game = game
    @current_turn = game.current_player_turn
    @winning_move = nil
  end

  def check_for_winning_move(turn)
    @winning_move = current_game.check_two(turn)
    @winning_move ? true : false
  end

  def analyze_state
    if current_game.finished?
      final_state_value
    end
  end

  def final_state_value
    if current_game.draw?
      0
    elsif current_game.winner == 1
      1
    elsif current_game.winner == 2
      -1
    end
  end

  def board_state
    current_game.board
  end

  def available_moves
    current_game.open_spaces
  end

  def make_move(input, player)
    current_game.set_player(input, player)
  end

  def next_move
    if check_for_winning_move(current_turn)
      current_game.set_player(winning_move, 1)
    else 
      current_game.set_player(available_moves.first, 1)
    end
  end


end