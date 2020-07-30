require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject (:dessert) {Dessert.new("brownie", 40, "Remy")}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(40)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { dessert.quantity("bb") }.to raise_error(ArgumentError) 
    end
  end

    describe "#add_ingredient" do
        it "adds an ingredient to the ingredients array" do
          expect(dessert.add_ingredient("spinach")).to eq(["spinach"])
        end
    end

    describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end
dessert
      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients.sort)
    end
  end

    describe "#eat" do
      it "subtracts an amount from the quantity" do 
        expect(dessert.eat(20)).to eq(20)
      end


      it "raises an error if the amount is greater than the quantity" do 
        expect { dessert.eat(10,000) }.to raise_error(ArgumentError) 
      end
    end

    describe "#serve" do
      it "contains the titleized version of the chef's name" do 
        allow(chef).to receive(:titleize).and_return("Chef Remy The Great Baker")
        expect(dessert.serve).to eq("Remy has made 40 brownies!")
      end
    end

    describe "#make_more" do
      it "calls bake on the dessert's chef with the dessert passed in" do 

      end
    end
end