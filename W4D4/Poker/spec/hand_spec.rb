
require 'hand'

describe Hand do 
    subject(:hand) do
        Hand.new("Drew")
    end
    
   describe "#initialize" do 
       it "should take an argument representing a player name" do 
           hand
       end

       it "should assign a player instance variable to the player name" do
           expect(hand.player_name).to eq("Drew")
       end

       it "should set @hand to an empty array" do
           expect(hand.hand).to eq([])
       end
   end

    describe "#deal_hand" do 
        let(:card) { double("card")}
        subject(:hand) { Hand.new("hand") }

        it "each hand must hase five cards" do 
            hand.should have(5).items
        end

        it "should deal unique cards" do
            allow("hand").to recieve(:card).and_return()
        end
    end

end
