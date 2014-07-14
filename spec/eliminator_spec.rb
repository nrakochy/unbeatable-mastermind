require_relative '../eliminator'


describe Eliminator do
  let(:possible_answers) do [
    # sample_set = ["red", "orange", "blue", "yellow"].repeated_combination(4).to_a 
    ["red", "red", "red", "red"],
    ["red", "red", "red", "orange"],
    ["red", "red", "red", "blue"],
    ["red", "red", "red", "yellow"],
    ["red", "red", "orange", "orange"],
    ["red", "red", "orange", "blue"],
    ["red", "red", "orange", "yellow"],
    ["red", "red", "blue", "blue"],
    ["red", "red", "blue", "yellow"],
    ["red", "red", "yellow", "yellow"],
    ["red", "orange", "orange", "orange"],
    ["red", "orange", "orange", "blue"],
    ["red", "orange", "orange", "yellow"],
    ["red", "orange", "blue", "blue"],
    ["red", "orange", "blue", "yellow"],
    ["red", "orange", "yellow", "yellow"],
    ["red", "blue", "blue", "blue"],
    ["red", "blue", "blue", "yellow"],
    ["red", "blue", "yellow", "yellow"],
    ["red", "yellow", "yellow", "yellow"],
    ["orange", "orange", "orange", "orange"],
    ["orange", "orange", "orange", "blue"],
    ["orange", "orange", "orange", "yellow"],
    ["orange", "orange", "blue", "blue"],
    ["orange", "orange", "blue", "yellow"],
    ["orange", "orange", "yellow", "yellow"],
    ["orange", "blue", "blue", "blue"],
    ["orange", "blue", "blue", "yellow"],
    ["orange", "blue", "yellow", "yellow"],
    ["orange", "yellow", "yellow", "yellow"],
    ["blue", "blue", "blue", "blue"],
    ["blue", "blue", "blue", "yellow"],
    ["blue", "blue", "yellow", "yellow"],
    ["blue", "yellow", "yellow", "yellow"],
    ["yellow", "yellow", "yellow", "yellow"]
    ]
   end
   
   let(:guess) do
     ["yellow", "red", "green", "green"]
   end
   
  describe "Key peg score match" do
    it "A key peg score of [1,0] should eliminate possible answers to those that only return [1,0] when compared to guess" do
      Eliminator.new(:guess, :possible_answers).reduce_answers(guess, [1,0],possible_answers).should =~ [
        
        ["red", "red", "red", "red"],
        ["red", "red", "red", "orange"],
        ["red", "red", "red", "blue"],
        ["red", "red", "orange", "orange"],
        ["red", "red", "orange", "blue"],
        ["red", "red", "blue", "blue"],
        ["yellow", "yellow", "yellow", "yellow"]
      
      ]
    end
   
    it "A key peg score of [0,2] should eliminate possible answers to those that only return [0,2] when compared to guess " do
      Eliminator.new(:guess, :possible_answers).reduce_answers(guess,[0,2], possible_answers).should =~ [  
    
   
      ["red", "orange", "orange", "yellow"],
      ["red", "orange", "blue", "yellow"],
      ["red", "orange", "yellow", "yellow"],
      ["red", "blue", "blue", "yellow"],
      ["red", "blue", "yellow", "yellow"],
      ["red", "yellow", "yellow", "yellow"],
   
      ]
      
    end
 
    it "A key peg score of [1,1] should eliminate possible answers to those that only return [1,1] when compared to guess" do
      Eliminator.new(:guess, :possible_answers).reduce_answers(guess,[1,1], possible_answers).should =~ [
     
        ["red", "red", "red", "yellow"],
        ["red", "red", "orange", "yellow"],
        ["red", "red", "blue", "yellow"],
        ["red", "red", "yellow", "yellow"]
        
        ]
 
    end
  
  end
  

  
  describe "Responds to 4 black pegs, 0 white pegs" do
      it "Returns the guess as the correct answer" do
        Eliminator.new(:guess, :possible_answers).reduce_answers(["red", "blue", "yellow", "yellow"], [4,0], possible_answers).should =~ [
         ["red", "blue", "yellow", "yellow"]
        ]
      end
  end

  
end