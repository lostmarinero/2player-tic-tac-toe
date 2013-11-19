class View
  def give_feedback
    puts "Nice move!"
  end 

  def get_input
    puts "Please select your desired position:"
    gets.chomp.to_i
  end

  def invalid_entry
    puts "Please enter a valid input"
  end

  def print_board(input_board)
    board = input_board.dup
    board.map!.with_index do |space, index|
      if space == 1
        " X "
      elsif space == 2
        " O "
      else
        " #{index} "
      end
    end

    puts <<-eos
    
    #######################

      #{board[0]} | #{board[1]} | #{board[2]}
      ---------------
      #{board[3]} | #{board[4]} | #{board[5]}
      ---------------
      #{board[6]} | #{board[7]} | #{board[8]}

    #######################

    eos
  end
  
  def finished_view(game)
    puts
    puts "##########################"
    puts
    puts "The game has ended"
    puts

    if game.winner
      puts <<-eos
        "#{game.winner} has won!"
      eos
    else
      puts <<-eos
        "Unfortunately it has ended in a tie"
      eos
    end

    print_board(game.board)

  end

end 