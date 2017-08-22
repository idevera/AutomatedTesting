
# card.rb

class Card
  attr_reader :value, :suit
  LEGAL_SUITS = [:hearts, :spades, :clubs, :diamonds]

  def initialize(value, suit)
    unless LEGAL_SUITS.include? suit
      raise ArgumentError.new("Invalid suit: #{suit}")
    end

    unless (1..13).include? value
      raise ArgumentError.new("Invalid value: #{value}")
    end

    @value = value
    @suit = suit
  end

  def to_s
    # Get the english name for the value, if applicable
    case @value
    when 1
      value = "Ace"
    when 11
      value = "Jack"
    when 12
      value = "Queen"
    when 13
      value = "King"
    else
      value = @value
    end

    return "#{value} of #{@suit.to_s}"
  end

end
