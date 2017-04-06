require "rspec"
require "hand"

describe Hand do
  let(:card1) { double("card1", value: 10, suit: :heart) }
  let(:card2) { double("card2", value: 11, suit: :heart) }
  let(:card3) { double("card3", value: 12, suit: :heart) }
  let(:card4) { double("card4", value: 13, suit: :heart) }
  let(:card5) { double("card5", value: 14, suit: :heart) }

  subject(:hand) { Hand.new([card1, card2, card3, card4, card5]) }
  describe "#initialize" do
    it "receives 5 cards" do
      expect(hand.hand.length).to eq(5)
    end

    it "has 5 unique cards" do
      expect(hand.hand.uniq.length).to eq(5)
    end
  end

  describe "::HAND_COMBOS" do
    it "has 9 elements" do
      expect(Hand::HAND_COMBOS.length).to eq(9)
    end

    it "starts with a straight flush" do
      expect(Hand::HAND_COMBOS.first).to eq(:straight_flush)
    end

    it "ends with high card" do
      expect(Hand::HAND_COMBOS.last).to eq(:high_card)
    end
  end

  describe "#set_hand_strength" do
    context "when given a straight_flush" do
      before(:each) do
        hand.set_hand_strength
        hand.set_card_strength
      end
      it "sets #hand_strength to straight_flush" do
        expect(hand.hand_strength).to eq(:straight_flush)
      end

      it "sets #card_strength to 14" do
        expect(hand.card_strength).to eq([14, 13, 12, 11, 10])
      end
    end

    context "when given a full house" do
      let(:card1) { double("card1", value: 10, suit: :heart) }
      let(:card2) { double("card2", value: 10, suit: :spade) }
      let(:card3) { double("card3", value: 14, suit: :spade) }
      let(:card4) { double("card4", value: 14, suit: :diamond) }
      let(:card5) { double("card5", value: 14, suit: :heart) }
      subject(:full_house) { Hand.new([card1, card2, card3, card4, card5]) }
      before(:each) do
        full_house.set_hand_strength
        full_house.set_card_strength
      end
      it "sets #hand_strength to full_house" do
        expect(full_house.hand_strength).to eq(:full_house)
      end
      it "sets #card_strength to 10" do
        expect(full_house.card_strength).to eq([14,14,14,10,10])
      end
    end
  end

  describe "#discard" do
    it "discard card from hand at index" do
      hand.discard(0)
      expect(hand.hand).to eq([card2,card3,card4,card5])
    end
  end


end
