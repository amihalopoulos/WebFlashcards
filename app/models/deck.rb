class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  has_many :rounds
  has_many :deck_users, through: :rounds, source: :user

  validates :topic, :user_id, presence: true

  def shuffle(cards)
    cards.shuffle
  end

end
