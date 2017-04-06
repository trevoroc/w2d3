class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    raise "Invalid card value" unless value.between?(2, 14)
    raise "Invalid card suit" unless [:heart, :diamond, :spade, :club].include?(suit)
    @value = value
    @suit = suit
  end
end
