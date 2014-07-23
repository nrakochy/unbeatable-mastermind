class Codemaker
  
  
  def initialize color_choices
   
  end
  
  def greeting
    puts <<-GREETING
MASTERMIND- YOU v. THE COMPUTER
And the Computer will break you.
      GREETING
      sleep(2)
    puts <<-START
(You can give up at any time by using Ctrl-C.)
Right now, your secret code is empty.
You will need to choose 4 colors from this list of options.
      START
      sleep(2)
  end
    
  def make_code color_choices
    code_pegs =[]
    i= 0    
    while i <= 3
      puts  "\nPlease choose color ##{i+1} to create your secret code: \n" + color_choices.each{|color| puts color}.join(" | ")
      codemaker_choice = gets.chomp.downcase
        if color_choices.include?(codemaker_choice)
          code_pegs.push(codemaker_choice)
          i += 1
        else
          puts "Sorry. Try again. You need to choose one of the 6 colors from the list."
        end
    end  
    
    puts "\nYour secret code is: \n" + code_pegs.each{|color| puts color}.join(", ")
    code_pegs
  end
  
end