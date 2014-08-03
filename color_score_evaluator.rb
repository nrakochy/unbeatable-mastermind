class Color_Score_Evaluator
  
  def score_pegs(guess, litmus)    
    key_pegs = [0,0]
    guess_count_of_colors = Hash.new(0)
    litmus_comparison = Hash.new(0)
    
    guess.each{|color| guess_count_of_colors[color] += 1}
    litmus.each{|color| litmus_comparison[color] += 1}
    
    guess_count_of_colors.each do |color, value|
      if guess_count_of_colors[color] <= litmus_comparison[color]
        key_pegs[1] += guess_count_of_colors[color]
      
      elsif guess_count_of_colors[color] > litmus_comparison[color]
        key_pegs[1] += litmus_comparison[color]
      end
    end
    
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
    
    key_pegs
    
  end

      
end