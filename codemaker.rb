class Codemaker  
  
  require_relative 'console_messages'
    
  def choose_secret_code
    color_choices = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']
    secret_code_pegs =[]
    
    i= 0    
    while i <= 3
      Console_Messages.new.choose_secret_code(color_choices, i)
      codemaker_choice = gets.chomp.downcase
      color_choices.include?(codemaker_choice) ? begin secret_code_pegs.push(codemaker_choice); i += 1 end : Console_Messages.new.color_error
    end  
    
    Console_Messages.new.secret_code_summary(secret_code_pegs)
    secret_code_pegs
  end
  
end