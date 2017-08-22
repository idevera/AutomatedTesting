
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
        (2..10).each do |value|
          card = Card.new(value, suit)
          card.to_s.must_equal "#{value} of #{suit}"
        end
      end
    end

    it "to_s returns a readable String value for Ace, Jack, Queen, King" do
      values = {
        "Ace" => 1,
        "Jack" => 11,
        "Queen" => 12,
        "King" => 13
      }
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        values.each do |name, value|
          card = Card.new(value, suit)
          card.to_s.must_equal "#{name} of #{suit}"
        end
      end
    end
  end

  describe "Reader methods" do

    it "Can retrieve the value of the card using a `.value`." do
      value = 4
      card = Card.new(value, :diamonds)
      card.must_respond_to :value
      card.value.must_equal value
    end

    it "Can retrieve the value of the card using a `.suit`." do
      suit = :diamonds
      card = Card.new(4, suit)
      card.must_respond_to :suit
      card.suit.must_equal suit
    end
  end

end
