require_relative 'spec_helper'

describe Deck do

  describe "Be able to create a Deck instance" do

    it "Can be created" do
      cards = []
      until cards.length == 52
        [:hearts, :spades, :clubs, :diamonds].each do |suit|
          (1..13).each do |value|
            card = Card.new(value, suit)
            cards << card
          end
        end
      end
      deck = Deck.new(cards)
      deck.must_be_instance_of Deck

      deck.must_respond_to :cards
      deck.cards.must_be_kind_of Array

      deck.must_respond_to :discard_pile
      deck.discard_pile.must_be_kind_of Array
    end
  end

  describe "Testing draw" do

    it "draw must return the first card of the deck"  do
      cards = []
      card1 = Card.new(4, :diamonds)
      cards << card1
      card2 = Card.new(6, :hearts) # TECHNICALLY THE TOP CARD IS THE LAST CARD IN THE ARRAY
      cards << card2

      deck = Deck.new(cards)
      deck.draw
      deck.cards.last.must_equal card2
    end

    it "Top card must be an instance of card" do
      cards = []
      card1 = Card.new(4, :diamonds)
      cards << card1
      card2 = Card.new(6, :hearts)  # TECHNICALLY THE TOP CARD IS THE LAST CARD IN THE ARRAY
      cards << card2

      deck = Deck.new(cards)
      deck.cards.last.must_be_instance_of Card
    end

    it "draw returns a String of value and suit" do
      cards = []
      card1 = Card.new(4, :diamonds)
      cards << card1
      card2 = Card.new(5, :hearts) # TECHNICALLY THE TOP CARD IS THE LAST CARD IN THE ARRAY
      cards << card2
      deck = Deck.new(cards)
      deck.draw.must_equal "#{5} of #{:hearts}"
    end
  end

  describe "Testing add_to_discard" do
    it "The top card of the draw pile is equal to the top card of discard" do
      cards = []
      card2 = Card.new(4, :diamonds) # ON BOTTOM [0]
      cards << card2
      card1 = Card.new(6, :hearts) # ON TOP [1]
      cards << card1
      deck = Deck.new(cards)
      deck.add_to_discard
      deck.discard_pile[0].must_equal card1
    end

    it "Decreases number of cards from cards array" do
      cards = []
      card2 = Card.new(4, :diamonds) # ON BOTTOM [0]
      cards << card2
      card1 = Card.new(6, :hearts) # ON TOP [1]
      cards << card1

      deck = Deck.new(cards)
      before_count = deck.cards.count
      deck.add_to_discard
      expected_count = before_count - 1
      deck.cards.count.must_equal expected_count
    end

    it "Cards in discard_pile are no longer in the draw pile" do
      cards = []
      card2 = Card.new(4, :diamonds) # ON BOTTOM [0]
      cards << card2
      card1 = Card.new(6, :hearts) # ON TOP [1]
      cards << card1
      deck = Deck.new(cards)
      deck.add_to_discard
      deck.discard_pile.each do |card|
        deck.cards.include?(card).must_equal false
      end
    end
  end # DESCRIBE

  describe "Testing return_discard_to_deck" do
    it "Decreases number of cards from discard_pile to 0" do
      cards = []
      deck = Deck.new(cards)
      card2 = Card.new(4, :diamonds) # ON BOTTOM [0] --> Will be on top [1]
      deck.discard_pile << card2
      card1 = Card.new(6, :hearts) # ON TOP [1] --> Will be on bottom [0]
      deck.discard_pile << card1

      deck.return_discard_to_deck
      deck.discard_pile.count.must_equal 0
    end

    it "Increases number of cards in cards array by number of discard cards" do
      cards = []
      deck = Deck.new(cards)
      card2 = Card.new(4, :diamonds) # ON BOTTOM [0] --> Will be on top [1]
      deck.discard_pile << card2
      card1 = Card.new(6, :hearts) # ON TOP [1] --> Will be on bottom [0]
      deck.discard_pile << card1

      before_count = deck.discard_pile.count
      deck.return_discard_to_deck
      before_count.must_equal deck.cards.count
    end

    it "Cards array must now have all cards" do
      cards = []
      deck = Deck.new(cards)
      card2 = Card.new(4, :diamonds) # ON BOTTOM [0] --> Will be on top [1]
      deck.discard_pile << card2
      card1 = Card.new(6, :hearts) # ON TOP [1] --> Will be on bottom [0]
      deck.discard_pile << card1

      before_count = deck.cards.count
      deck.return_discard_to_deck
      expected_total = deck.cards.count + before_count
      deck.cards.count.must_equal expected_total
    end

    it "Cards array must be at bottom of deck and discard on top" do
      cards = []
      deck = Deck.new(cards)
      card2 = Card.new(4, :diamonds) # ON BOTTOM [0] --> Will be on top [1]
      deck.discard_pile << card2
      card1 = Card.new(6, :hearts) # ON TOP [1] --> Will be on bottom [0]
      deck.discard_pile << card1
      deck.return_discard_to_deck
      deck.cards.must_equal [card1, card2]
    end
  end

  # MAY NOT BE ABLE TO TEST FOR SHUFFLE
  # describe "Testing shuffle" do
  #   it "shuffle returns a new cards array not equal to the first cards array " do
  #     cards = []
  #     card = Card.new(4, :diamonds)
  #     cards << card
  #     card = Card.new(6, :hearts)
  #     cards << card
  #     card = Card.new(7, :spades)
  #     cards << card
  #
  #     deck = Deck.new(cards)
  #     deck.shuffle.wont_be_same_as cards
  #   end
  # end

  # Needs to return total count at time of count
  describe "Testing count_draw_pile" do
    it "Returns total number of cards in draw pile only" do
      cards = []
      52.times do
        card = Card.new(4, :diamonds)
        cards << card
      end
      deck = Deck.new(cards)
      deck.count_draw_pile.must_equal 52
    end
  end # DESCRIBE
end # DECK


# Access the instance variable by dot notation deck.discard_pile
# Pass in everything in the method with any values
# Write tests for the Deck class.
# What should you test?
  # 1.  Expected Behavior
  # 2.  Edge cases
