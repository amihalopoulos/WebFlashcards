class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  belongs_to :round

  validates :user_id, :card_id, :round_id, presence: true

  def guess_correct?(card)
    self.user_input == card.term
  end

  def update_round(card, round)
    guess_correct?(card) ? round.num_correct += 1 : round.num_incorrect += 1
    round.save
  end
end
