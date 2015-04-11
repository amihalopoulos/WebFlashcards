class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  has_many :users, through: :rounds
  belongs_to :user

  def self.create_new_deck(args)
    deck = Deck.create(name: args[:name], description: args[:description], user: args[:user])
    File.open(args[:path]) do |f|
      f.each_line do |line|
        array = line.chomp.split(',')
        question = array[0].to_s.downcase
        answer = array[1].to_s.downcase
        Card.create(question: question, answer: answer, deck: deck)
      end
    end
  end

end
