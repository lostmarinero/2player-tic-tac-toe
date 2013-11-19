require_relative('game_controller')
require_relative('player')
require_relative('view')

class Game

  attr_accessor :board, :winner
  attr_reader :players, :turns

  def initialize(player1, player2)
    self.board = Array.new(9) { 0 }
    @players = [Player.new(player1, 1), Player.new(player2, 2)]
    @turns = 0
    @winner = nil
  end

  def winning_combos
    [[0, 1, 2], [3, 4, 5], [6, 7, 8],
     [0, 3, 6], [1, 4, 7], [2, 5, 8],
     [0, 4, 8], [2, 4, 6]]
  end  

  def three_in_a_row(winning_combo)
    board[winning_combo[0]] == self.board[winning_combo[1]] && self.board[winning_combo[1]] == self.board[winning_combo[2]]
  end

  def check_player_wins(player)
    winning_combos.each do |winning_combo|
      if board[winning_combo[0]] == player
        if three_in_a_row(winning_combo)
          @winner = player
        end
      end
    end
  end

  def current_player_turn
    turns % 2 == 0 ? 1 : 2
  end

  def check_space(input)
    board[input] == 0
  end

  def open_spaces
    board.map.with_index { |space, index| index if check_space(index) }.compact
  end

  def set_player(input, player_num)
    board[input] = player_num
  end

  def filled?
    !board.include?(0)
  end

  def finished?
    filled? || !winner.nil?
  end

  def next_turn
    @turns += 1
  end

end
