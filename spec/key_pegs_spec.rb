require_relative '../key_pegs.rb'
require 'spec_helper'

describe Key_Pegs do
  
  let(:secret_code) do
    ["red", "orange", "blue", "yellow"]
   end
   
   
  describe "Returning the black and white pegs score for each guess" do
    
    it "should return [0,1] when it receives a guess of ['green', 'green', 'red', green]" do
      Key_Pegs.new.score_pegs(['green', 'green', 'red', 'green'], secret_code).should =~ 

        [0,1]
    
    end
    
    it "should return [1,0] when it receives guess of ['red', 'green', 'red', green] It should return [1,0]" do
      Key_Pegs.new.score_pegs(['red', 'green', 'red', 'green'], secret_code).should =~    
      
        [1,0]
    
    end
    
    it "should return [1,1] when it receives a guess of ['red', 'green', 'orange', green]" do
      Key_Pegs.new.score_pegs(['red', 'green', 'orange', 'green'], secret_code).should =~ 
      
        [1,1]

    end
   
  end 
      
 

  
end
