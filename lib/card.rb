class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    if value > 0 && value < 14
      @value = value
    else
      raise ArgumentError
    end
    @suit = suit
  end

  def to_s
    if @value == 1
      return "Ace of #{suit.to_s}"
    elsif @value == 11
      return "Jack of #{suit.to_s}"
    elsif @value == 12
      return "Queen of #{suit.to_s}"
    elsif @value == 13
      return "King of #{suit.to_s}"
    else
      return "#{value} of #{suit.to_s}"
    end
  end
end
