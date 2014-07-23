class Mastermind
  
  require_relative 'codemaker'
  require_relative 'codebreaker'
  require_relative 'key_pegs'

  
  def initialize
    #codemaker
    @color_peg_options = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']
   
    #codebreaker
    @computer_guess = ["red", "red", "orange", "orange"]
    @possible_answers =  @color_peg_options.repeated_permutation(4).to_a
    @answer_score = []
   
    
    #start game
    play_game
  end
  
  def play_game
    
    codemaker = Codemaker.new(@color_peg_options)
    codebreaker = Codebreaker.new(@possible_answers, @answer_score)
    pegs = Key_Pegs.new
    
    #start game, request human player input for choosing secret code
    codemaker.greeting
    secret_code = codemaker.make_code(@color_peg_options)
    
    #codebreaker instructions
    codebreaker.give_instructions
    
    number_of_turns = 0
    #reduce answers in loop until secret code is cracked
    while @answer_score != [4,0]
      puts "Thinking..."
      sleep(2.5)

      
      @answer_score = pegs.score_pegs(@computer_guess, secret_code) 
      number_of_turns += 1
       
      puts "For Round \##{number_of_turns}, I guessed #{@computer_guess}. The valuation of the peg score is #{@answer_score}." 
      
      if @answer_score != [4,0]
        
        @possible_answers = codebreaker.reduce_answers(@computer_guess, @answer_score, @possible_answers)
        @computer_guess = codebreaker.determine_next_move(@possible_answers)
        puts "Possible answers remaining = #{@possible_answers.length}." if @possible_answers.length > 1 
      else 
        puts "Looks like I have the answer. It's #{@computer_guess}."          
      end
    end
    
    puts <<-GAME_OVER
Game over. You lose. It only took me #{number_of_turns} turns.
I will crush you next time too, so it is time to quit. I thoroughly enjoyed this time together. Ciao.
    GAME_OVER
  
  
  end 
      
end
  
  

  
Mastermind.new
  




