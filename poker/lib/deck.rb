require_relative "card"

class Deck

  def self.build
    stack = []
    values = (2..14).to_a
    suits = [:heart, :diamond, :club, :spade]

    values.each do |value|
      suits.each do |suit|
        stack << Card.new(value,suit)
      end
    end

    Deck.new(stack)
  end

  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def draw_card
    @deck.pop
  end

  def shuffle!
    @deck.shuffle!
  end
end
