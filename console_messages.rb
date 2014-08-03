class Console_Messages
  
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
  
  def choose_secret_code color_choices, i 
    puts "\nPlease choose color ##{i+1} to create your secret code: \n" + color_choices.each{|color| puts color}.join(" | ")
  end
  
  def color_error
    puts "Sorry. Try again. You need to choose one of the 6 colors from the list."
  end
  
  def secret_code_summary code_pegs
    puts "\nYour secret code is: \n" + code_pegs.each{|color| puts color}.join(", ")
  end
  
  def game_overview
    puts <<-GAME_OVERVIEW  
    
The game works like this- I, SuperIntelligent Computer, will enter a guess to break your code. 
Based on my guess, I will receive back the key pegs score. 
  
The first number will represent the number of correct colors guessed in correct position. 
The second number represents the number of correct colors guessed in the wrong position. 

If it takes me more than 10 guesses to crack your code, you win. 
Make sense? 

GAME_OVERVIEW
    sleep(2)
    puts 'I will destroy you now.'   
  end
  
  def thinking
    puts "Thinking..."
    sleep(2.5)
  end
  
  def move_summary number_of_turns, computer_guess, answer_score
    puts "For Round \##{number_of_turns}, I guessed #{computer_guess}. The valuation of the peg score is #{answer_score}."
  end
  
  def remaining_possible_answers remaining_answers
    puts "Possible answers remaining = #{remaining_answers.length}."
  end
  
  def game_over number_of_turns
    puts <<-GAME_OVER
    
Game over. You lose. And it only took me #{number_of_turns} turns.
I will crush you next time too, so it is time to quit. 
I thoroughly enjoyed this time together. Ciao.

GAME_OVER
  end

end