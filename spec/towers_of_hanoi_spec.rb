require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe "#initialize" do
    context "creates game board" do
      it "should have disks on one pile" do
        expect(game.piles.first.length).to eq(3)
      end
      it "should have smaller disks at the top" do
        expect(game.piles.first).to eq([3, 2, 1])
      end
    end
  end

  describe "#move" do
    before(:each) do
      game.move(0,2)
    end
    it "should move disk from start to end pile" do
      expect(game.piles.last).to eq([1])
    end
    it "should raise error if moving bigger disk on smaller disk" do
      expect { game.move(0,2) }.to raise_error("Invalid move")
    end

  end

  describe "#won?" do
    before(:each) do
      [[0,2], [0,1], [2,1], [0,2], [1,0], [1,2]].each do |start_pos,end_pos|
        game.move(start_pos, end_pos)
      end
    end
    it "should return false if disks not in order in nonstarting pile" do
      expect(game.won?).to be false
    end
    it "should return true if all disks are moved to nonstarting pile" do
      game.move(0,2)
      expect(game.won?).to be true
    end
  end

end
