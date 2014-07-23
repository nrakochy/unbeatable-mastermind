class Codebreaker
  
  require_relative 'key_pegs'
  
  
  def initialize answer_pool, litmus_peg_score
    
  end
  
  def give_instructions
    puts <<-INSTRUCTIONS
    
The way this game works: I, SuperIntelligent Computer, will enter a guess to break your code. 
Based on my guess, I will receive back the key pegs score. 
  
The first number will represent the number of correct colors guessed in correct position. 
The second number represents the number of correct colors guessed in the wrong position. 

If it takes me more than 10 guesses to crack your code, you win. 
Make sense? 
    INSTRUCTIONS
    
    sleep(2)
    puts 'I will destroy you now.'
      
  end
  
=begin
  The key to the reduction method is the importance of symmetric scoring (which I found on this Python discussion - stackoverflow.com/questions/1185634/how-to-solve-the-mastermind-guessing-game).
  There are only 1296 possible answers. When an input_guess is entered, it returns a key_peg value. That value can then be used as a test score with input_guess.
  For example, if the answer ['red','orange','yellow','green'] returns a key_peg value of [1,0], the codebreaker is then run against all remaining answers, 
  keeping only the remaining_answers which have a matching key_peg value of [1,0] when compared to the input_guess of ['red','orange','yellow','green']. 
  The secret_code will be found within those matches, (thus 'symmetric scoring') and the recursion will return the correct answer within 7 guesses. 
=end
  def reduce_answers input_guess, litmus_peg_score, answer_pool
    pegs = Key_Pegs.new
    remaining_answers = []
    
    answer_pool.each do |arr| 
      arr_score = pegs.score_pegs(arr, input_guess) 
      remaining_answers.push(arr) if arr_score == litmus_peg_score
    end
      
    remaining_answers    
  end


  def determine_next_move answer_pool
    answer_pool.first
  end

end

 