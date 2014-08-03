class Codebreaker
  
  require_relative 'console_messages'
  require_relative 'color_score_evaluator'
  require_relative 'ai_reducer'
  require_relative 'move_maker'
  
  def break_code secret_code
    computer_guess ||= ['red','red','orange','orange']
    answer_pool ||= ['red','orange','yellow','green', 'blue', 'purple'].repeated_permutation(4).to_a
    number_of_turns = 0
    answer_score = []
    
    while answer_score != [4,0]
      Console_Messages.new.thinking
      answer_score = Color_Score_Evaluator.new.score_pegs(secret_code, computer_guess)
      number_of_turns += 1
      Console_Messages.new.move_summary(number_of_turns, computer_guess, answer_score)
      answer_pool = AI_Reducer.new.reduce_available_answers(answer_pool,computer_guess, answer_score)
      Console_Messages.new.remaining_possible_answers(answer_pool) if answer_score != [4,0]
      computer_guess = Move_Maker.new.determine_next_move(answer_pool) 
    end
    
    Console_Messages.new.game_over(number_of_turns)
  end

end

