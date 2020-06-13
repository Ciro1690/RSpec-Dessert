require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new('brownie',10,'cheers')}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('brownie')
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("brownie","10","cheers")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient(:milk)
      expect(dessert.ingredients).to include(:milk)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.mix!
      expect(dessert.ingredients).to include(dessert.ingredients.shuffle)
    end
  end

  describe "#eat" do
    before(:each) {dessert.eat(10)}

    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq dessert.quantity
    end 

    it "raises an error if the amount is greater than the quantity" do
      expect {(dessert.quantity).to raise_error("not enough left!")}
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      Chef.new("Cheers")
      expect(dessert.serve).to include ("Cheers")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      chef.bake('brownies')
      expect dessert.make_more.to eq chef.bake('brownies')
    end
  end
end
