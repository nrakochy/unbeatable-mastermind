class Mastermind
  
  require_relative 'console_messages'
  require_relative 'codemaker'
  require_relative 'codebreaker'
  
  def play_game
    Console_Messages.new.greeting
    secret_code = Codemaker.new.choose_secret_code
    Console_Messages.new.game_overview
    Codebreaker.new.break_code(secret_code)
  end 
      
end
  
Mastermind.new.play_game
  




