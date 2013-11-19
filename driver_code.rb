require_relative('game')



#========== Driver Code ====================

puts 'Please enter your name to start the game'
name = gets.chomp
current_game = GameController.new(name)
current_game.run_game
