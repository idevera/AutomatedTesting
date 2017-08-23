require_relative 'card'

class Deck
  attr_accessor :cards, :discard_pile

  def initialize(cards)
    @cards = cards
    @discard_pile = []
  end

  def draw
    top_card = @cards.last
    return "#{top_card.value} of #{top_card.suit}"
  end

  def add_to_discard
    top_card = @cards.last
    @discard_pile << top_card # Temp var
    @cards.delete(top_card)
    return @discard_pile
  end

  def return_discard_to_deck
    @discard_pile.reverse.each do |card|
      @cards << card
    end
    return @discard_pile = [] # Reset to empty array instance
  end

  def shuffle
     @cards = @cards.shuffle
    return @cards
  end

  def count_draw_pile
    return @cards.count
  end
end
