#plays until the opponent is defeated
  def crush_the_opponent
    puts <<-INSTRUCTIONS
    
The way this game works: I, SuperIntelligent Computer, will enter a guess to break your code. 
Based on my guess, I will receive back the key pegs score. 
  
The first number will represent the number of correct colors guessed in correct position. 
The second number represents the number of correct colors guessed in the wrong position. 
Make sense? 
    INSTRUCTIONS
    
    sleep(2)
    puts 'I will destroy you now.'
    number_of_turns = 0
    
    while @key_pegs != [4,0] 
      puts "Thinking..."
      sleep(2)
      score_pegs(@computer_guess, @secret_code)
      number_of_turns += 1
      
      puts "For Round \##{number_of_turns}, I guessed #{@computer_guess}. The valuation of the peg score is #{@key_pegs}." 
      
      if @key_pegs != [4,0]
        reduce_answers(@computer_guess, @key_pegs, @possible_answers)
        determine_next_move 
        puts "Possible answers remaining = #{@possible_answers.length}." if @possible_answers.length > 1 
      else 
        puts "Looks like I have the answer. It's #{@computer_guess}."          
      end
    end
    
    puts <<-GAME_OVER
Game over. You lose. It only took me #{number_of_turns} turns.
I will crush you next time too, so it is time to quit.
    GAME_OVER
  
    
    
  
  end 


 