require_relative '../key_pegs.rb'

describe Key_Pegs do
  
  let(:secret_code) do
    ["red", "orange", "blue", "yellow"]
   end
   
   
  describe "Returning the black and white pegs score for each guess" do
    it "A guess of ['green', 'green', 'red', green] should return [0,1]" do
      Key_Pegs.new(:secret_code).score_pegs(['green', 'green', 'red', 'green'], secret_code).should =~ 

        [0,1]
    
    end
    
    it "A guess of ['red', 'green', 'red', green] should return [1,0]" do
      Key_Pegs.new(:secret_code).score_pegs(['red', 'green', 'red', 'green'], secret_code).should =~    
      
        [1,0]
    
    end
    
    it "A guess of ['red', 'green', 'orange', green] should return [1,1]" do
      Key_Pegs.new(:secret_code).score_pegs(['red', 'green', 'orange', 'green'], secret_code).should =~ 
      
        [1,1]

    end
   
  end 
      
 

  
end
