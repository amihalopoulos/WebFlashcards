class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  belongs_to :user

  def next_card
    remaining_cards = deck.cards.collect do |card|
      next if card.guesses.any? {|guess| guess.correct }
      card
    end
    remaining_cards.sample
  end

  def number_of_guesses
    guesses.count
  end

  def number_of_cards
    deck.cards.count
  end

  def guess_percentage
    number_of_cards/number_of_guesses
  end

end
