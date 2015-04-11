
class Round < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  belongs_to :user

  def next_card
    correct_cards = []
    guesses.each do |guess|
      card = guess.card
      correct_cards << card if guess.correct
    end
    remaining_cards = deck.cards - correct_cards
    remaining_cards.sample
  end

  def number_of_guesses
    guesses.count
  end

  def number_of_cards
    deck.cards.count
  end

end
