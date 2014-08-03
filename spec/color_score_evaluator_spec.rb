require_relative '../color_score_evaluator.rb'
require 'spec_helper'

describe Color_Score_Evaluator do
  
  let(:secret_code) do
    ["red", "orange", "blue", "yellow"]
   end
   
   
  describe "Returning the black and white pegs score for each guess" do
    
    it "should return [0,1] when it receives a guess of ['green', 'green', 'red', green]" do
      Color_Score_Evaluator.new.score_pegs(['green', 'green', 'red', 'green'], secret_code).should =~ 
        [0,1]
    end
    
    it "should return [1,0] when it receives guess of ['red', 'green', 'red', green]" do
     Color_Score_Evaluator.new.score_pegs(['red', 'green', 'red', 'green'], secret_code).should =~    
        [1,0]
    end
    
    it "should return [1,1] when it receives a guess of ['red', 'green', 'orange', green]" do
      Color_Score_Evaluator.new.score_pegs(['red', 'green', 'orange', 'green'], secret_code).should =~ 
        [1,1]
    end
   
  end 
      
 

  
end
