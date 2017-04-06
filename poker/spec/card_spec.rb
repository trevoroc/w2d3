require "rspec"
require "card"

describe Card do
  subject(:card) { Card.new(3, :heart)}
  describe "#initialize" do
    it "should have a value" do
      expect(card.value).to eq(3)
    end

    it "should raise an error if value is not between 2 and 14" do
      expect { Card.new(15, :heart) }.to raise_error("Invalid card value")
    end

    it "should raise an error if invalid suit given" do
      expect { Card.new(11, :flower) }.to raise_error("Invalid card suit")
    end
    
    it "should have a suit" do
      expect(card.suit).to eq(:heart)
    end
  end
end
