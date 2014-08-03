require_relative '../ai_reducer'
require 'spec_helper'


describe AI_Reducer do
  let(:answer_pool) do 
    ["red", "orange", "blue", "yellow"].repeated_combination(4).to_a 
  end
   
  let(:computer_guess) do
     ["yellow", "red", "green", "green"]
  end
   
  describe "Reducer keeps the correct possible answers based on the input key peg score" do
    it "A key peg score of [1,0] should only keep the possible answers that return a symmetric score of [1,0] when compared to computer guess" do
      AI_Reducer.new.reduce_available_answers(answer_pool, computer_guess, [1,0]).should =~ [
        
        ["red", "red", "red", "red"],
        ["red", "red", "red", "orange"],
        ["red", "red", "red", "blue"],
        ["red", "red", "orange", "orange"],
        ["red", "red", "orange", "blue"],
        ["red", "red", "blue", "blue"],
        ["yellow", "yellow", "yellow", "yellow"]
      
      ]
    end
   
    it "A key peg score of [0,2] should only keep the possible answers that return a symmetric score of [0,2] when compared to computer guess " do
       AI_Reducer.new.reduce_available_answers(answer_pool, computer_guess,[0,2]).should =~ [  
    
      ["red", "orange", "orange", "yellow"],
      ["red", "orange", "blue", "yellow"],
      ["red", "orange", "yellow", "yellow"],
      ["red", "blue", "blue", "yellow"],
      ["red", "blue", "yellow", "yellow"],
      ["red", "yellow", "yellow", "yellow"],
   
      ]  
    end
 
    it "A key peg score of [1,1] should only keep the possible answers that return a symmetric score of [1,1] when compared to computer guess" do
       AI_Reducer.new.reduce_available_answers(answer_pool, computer_guess,[1,1]).should =~ [
     
        ["red", "red", "red", "yellow"],
        ["red", "red", "orange", "yellow"],
        ["red", "red", "blue", "yellow"],
        ["red", "red", "yellow", "yellow"]
        
        ]
    end
  end
  

  
  describe "Responds to 4 black pegs, 0 white pegs" do
    it "Returns the guess as the correct answer" do
      AI_Reducer.new.reduce_available_answers(answer_pool, ["red", "blue", "yellow", "yellow"], [4,0]).should =~ [
        
         ["red", "blue", "yellow", "yellow"]
        
        ]
    end
  end
  
end
