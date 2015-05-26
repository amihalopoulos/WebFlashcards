class User < ActiveRecord::Base
  has_secure_password
  has_many :decks
  has_many :rounds
  has_many :guesses
  has_many :played_decks, through: :rounds, source: :deck

  validates :name, :password_digest, presence: true

  def foreign_decks
    Deck.all.select do |deck|
      deck if deck.user_id != self.id
    end
  end

end
