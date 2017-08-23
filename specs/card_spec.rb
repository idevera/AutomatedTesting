require_relative 'spec_helper'

describe Card do
  describe "You can create a Card instance" do

    it "Can be created" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          card.must_be_instance_of Card
        end
      end
    end

    it "Raises an ArgumentError for invalid parameters" do
      proc {Card.new(0, :diamonds)}.must_raise ArgumentError
      proc {Card.new(14, :diamonds)}.must_raise ArgumentError
      proc {Card.new(14, :clovers)}.must_raise ArgumentError
    end
  end

  describe "Testing to_s" do

    it "to_s returns a readable String value logically for values 2-10" do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          if value >= 2 && value <= 10
            card.to_s.must_equal "#{value} of #{suit.to_s}"
          end
        end
      end
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      # Test to ensure that to_s works for cards values 1, and 11-13
      # For example: "Queen of hearts"
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          if value == 1
            card.to_s.must_equal "Ace of #{suit.to_s}"
          elsif value == 11
            card.to_s.must_equal "Jack of #{suit.to_s}"
          elsif value == 12
            card.to_s.must_equal "Queen of #{suit.to_s}"
          elsif value == 13
            card.to_s.must_equal "King of #{suit.to_s}"
          else
            card.to_s.must_equal "#{value} of #{suit.to_s}"
          end
        end
      end
    end

  describe "Reader methods" do
    it "Can retrieve the value of the card using a `.value`." do
      # ensure that `.value works as expected`
      card = Card.new(5, :diamond)
      card.value.respond_to? :value
      card.value.must_equal 5
    end

    it "Can retrieve the value of the card using a `.suit`." do
      # ensure that `.suit works as expected returning the symbol of the suit`
      card = Card.new(5, :diamond)
      card.suit.respond_to? :suit
      card.suit.must_equal :diamond
    end
  end
end
end
