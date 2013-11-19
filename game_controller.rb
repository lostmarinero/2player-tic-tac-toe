class GameController

  attr_accessor :current_game, :view

  def initialize(player)
    self.current_game = Game.new(player, 'Computer')
    self.view = View.new
  end


  def run_game
    until current_game.finished?
      view.print_board(current_game.board)
      move = get_player_input(player_turn)
      make_move(player_turn, move)
      check_winner(player_turn)
      change_turns
    end
    view.finished_view(current_game)
  end

  def check_space_availability(input)
    if current_game.open_spaces.include?(input)
      true
    else
      self.view.invalid_entry
      false
    end
  end

  def player_turn
    current_game.current_player_turn
  end

  def check_winner(player)
    current_game.check_player_wins(player)
  end


  def make_move(player, move)
    current_game.set_player(move, player)
    self.view.give_feedback
  end

  def get_player_input(player)
    space_available = nil

    until space_available
      input = self.view.get_input
      space_available = check_space_availability(input)
    end

    input
  end

  def change_turns
    current_game.next_turn
  end
end
