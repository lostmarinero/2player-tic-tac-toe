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

  def three_in_a_row(winning_combo, player)
    if board[winning_combo[1]] == player
      [board[winning_combo[0]], board[winning_combo[1]], board[winning_combo[2]]].uniq.length == 1
    end
  end

  def two_in_a_row(winning_combo, player)
    if board[winning_combo[1]] == player
      if board[winning_combo[0]] == board[winning_combo[1]] && board[winning_combo[0]] == player
        winning_combo[2]
      elsif board[winning_combo[1]] == board[winning_combo[2]] 
        winning_combo[0]
      end
    end
  end

  def check_two(player)
    winning_combos.each do |winning_combo|
        open_space = two_in_a_row(winning_combo, player)
        return open_space if !open_space.nil?
    end
    nil
  end

  def check_win(player)
    winning_combos.each do |winning_combo|
      if three_in_a_row(winning_combo, player)
        @winner = player
        return true
      end
    end
    false
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

  def draw?
    !board.include?(0) && winner.nil?
  end

  def finished?
    draw? || !winner.nil?
  end

  def next_turn
    @turns += 1
  end

end
