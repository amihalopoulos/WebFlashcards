class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, through: :rounds

  has_secure_password

  def self.authenticate(args)
    user = User.find_by(email: args[:email])
    if user
      user.authenticate(args[:password])
    else
      nil
    end
  end

end
