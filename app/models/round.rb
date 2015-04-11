require 'byebug'

class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  belongs_to :user

  def next_card
    remaining_cards = deck.cards.dup
    guesses.each do |guess|
      card = guess.card
      remaining_cards.delete(card) if remaining_cards.include?(card)
    end
    remaining_cards.sample
  end

  def number_of_guesses
    guesses.count
  end

  def number_of_cards
    deck.cards.count
  end

  def miss_rate
    number_of_guesses - number_of_cards/number_of_cards
  end

end
