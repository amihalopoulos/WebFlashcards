class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  validates :term, :description, :deck_id, presence: true
end
