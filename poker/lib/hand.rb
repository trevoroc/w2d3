require_relative "card"

class Hand
  attr_reader :hand, :hand_strength, :card_strength

  HAND_COMBOS = [
    :straight_flush,
    :four_of_a_kind,
    :full_house,
    :flush,
    :straight,
    :three_of_a_kind,
    :two_pair,
    :one_pair,
    :high_card
  ]

  def initialize(hand)
    @hand = hand
  end

  def set_hand_strength
    HAND_COMBOS.each do |combo|
      if method(combo).call
        @hand_strength = combo
        break
      end
    end
  end

  def set_card_strength
    sorted_hand = @hand.sort_by { |card| [hand.count(card), -card.value] }
    @card_strength = sorted_hand.map { |card| card.value }
  end

  def discard(index)
    @hand.delete_at(index)
  end

  private

  def straight_flush
    flush && straight
  end

  def four_of_a_kind
    values = @hand.map(&:value)
    values.uniq.any? { |value| values.count(value) == 4 }
  end

  def full_house
    @hand.map(&:value).uniq.length == 2
  end

  def flush
    @hand.map {|card| card.suit }.uniq.length == 1
  end

  def straight
    sorted_hand = @hand.map { |card| card.value }
    return true if sorted_hand.sort == [2,3,4,5,14]
    (1..4).all? { |idx| (sorted_hand[idx] - sorted_hand[idx - 1]) == 1 }
  end

  def three_of_a_kind
    @hand.map(&:value).uniq.length == 3
  end

  def one_pair
    @hand.map(&:value).uniq.length == 4
  end

  def high_card
    @hand.map(&:value).uniq.length == 5
  end
end
