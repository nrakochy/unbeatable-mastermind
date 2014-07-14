
class Eliminator
  
  
    def initialize (guess, possible_answers)
    end

    def score_pegs(guess, litmus)    
       key_pegs = [0,0]
       
       #getting white key pegs- move guess and litmus into hashes- compare 
       guess_count = Hash.new(0)
    
       #removed  guess.each{|arr| arr.each{}  DOES this need to be put back?
       guess.each{|color| guess_count[color] += 1}
    
       litmus_count = Hash.new(0)
       litmus.each{|color| litmus_count[color] += 1}
    
       guess_count.each do |color, value|
         if guess_count[color] <= litmus_count[color]
           key_pegs[1] += guess_count[color]
      
         elsif guess_count[color] > litmus_count[color]
           key_pegs[1] += litmus_count[color]
         end
       end
    
    
       #getting number of black key pegs- move guess and litmus into arrays with index number- look for matches
       guess_array= []
       litmus_array = []
       guess.each_with_index{|color, index| guess_array << [color,index]}  
       litmus.each_with_index{|color, index| litmus_array << [color,index]}
    
  
       i = 0
       while i <= 3
      
           if guess_array[i] == litmus_array[i]
             key_pegs[0] += 1
             key_pegs[1] -= 1
           end
    
         i += 1
       end
    
       @key_pegs = key_pegs
    
     end

  
  
    def reduce_answers(guess, pegs_score, possible_answers)
      remaining_answers = []
      possible_answers.each do |arr| 
        score_pegs(arr, guess) 
        remaining_answers.push(arr) if @key_pegs == pegs_score
      end
      
      @possible_answers = remaining_answers    
    end


    def determine_next_move
      @computer_guess = @possible_answers.first
    end
      
end