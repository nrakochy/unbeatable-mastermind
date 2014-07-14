class Mastermind
  
  require_relative 'codemaker'
  require_relative 'codebreaker'
  require_relative 'reducer'
  
  
  
  def initialize
    
    #codemaker
    @color_peg_options = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']

    #codebreaker
    @computer_guess = ["red", "red", "orange", "orange"]
    @possible_answers = @color_peg_options.repeated_permutation(4).to_a
    @key_pegs = []
    
    #start game
    play_game
  end
  
  def play_game
    #codemaker
    greeting
    make_code
    #codebreaker
    crush_the_opponent
  end
  
  
end
  
Mastermind.new
  




