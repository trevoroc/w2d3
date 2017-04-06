require "rspec"
require "deck"

describe Deck do
  subject(:deck) { Deck.build }

  describe "#initialize" do
    it "should raise error if no argument passed" do
      expect{ Deck.new() }.to raise_error(ArgumentError)
    end
  end

  describe "::build" do

    it "should have 52 elements inside array" do
      expect(deck.deck.length).to eq(52)
    end
    it "should contain only card objects" do
      expect(deck.deck.all? {|card| card.is_a? Card}).to be true
    end
    it "should return a Deck object" do
      expect(deck.is_a? Deck).to be true
    end
    it "should have 13 values for each suit" do
      suits_array = deck.deck.map { |card| card.suit }
      expect(suits_array.count(:heart)).to eq(13)
      expect(suits_array.count(:club)).to eq(13)
      expect(suits_array.count(:diamond)).to eq(13)
      expect(suits_array.count(:spade)).to eq(13)
    end
    it "should have 4 cards for each value" do
      values_array = deck.deck.map { |card| card.value }
      (2..14).each do |value|
        expect(values_array.count(value)).to eq(4)
      end
    end
  end

  describe "#draw_card" do
    it "should remove card from deck" do
      deck.draw_card
      expect(deck.deck.length).to eq(51)
    end
    it "should return a card object" do
      expect(deck.draw_card.is_a? Card).to be true
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      original_deck = deck.deck.dup
      deck.shuffle!
      expect(deck.deck).to_not eq(original_deck)
      expect(deck.deck.sort_by { |card| card.hash }).to eq(original_deck.sort_by { |card| card.hash })
    end
  end
end
