class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  validates :num_incorrect, :num_correct,
            :user_id, :deck_id, presence: true

  def calculate_score
    ((self.num_correct).to_f / self.deck.cards.count) * 100
  end
end
