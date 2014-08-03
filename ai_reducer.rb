class AI_Reducer
  
  require_relative 'color_score_evaluator'
  
  def reduce_available_answers answer_pool, computer_guess, answer_score 
    remaining_answers = []
    answer_pool.each do |arr| 
      arr_score = Color_Score_Evaluator.new.score_pegs(arr, computer_guess) 
      remaining_answers.push(arr) if arr_score == answer_score
    end 
    answer_pool = remaining_answers
  end

end