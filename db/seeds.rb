require 'faker'

index = 0
10.times do
  index += 1
  User.create(name: Faker::Name.name, email: "#{index}@email.com", password: "123")
end

state_capital_hash = {
  name: "State Capitals",
  description: "Learn the state capitals",
  path: File.expand_path('../seed_data/states.csv', __FILE__),
  user: User.find(rand(10) + 1)
}

Deck.create_new_deck(state_capital_hash)

world_capital_hash = {
  name: "World Capitals",
  description: "Learn the capitals from around the world",
  path: File.expand_path('../seed_data/country-capitals.csv', __FILE__),
  user: User.find(rand(10) + 1)
}

Deck.create_new_deck(world_capital_hash)

test_deck = Deck.create(name: "Test Deck", description: "Answers are the same numbers", user: User.find(rand(10) + 1))

5.times do |i|
  test_deck.cards << Card.new(question: i.to_s, answer: i.to_s)
end

alpha_deck = Deck.create(name: "Alphabet Test Deck", description: "Learn your ABCs", user: User.find(rand(10) + 1))

['A', 'B', 'C', 'D', 'E'].each do |element|
  alpha_deck.cards << Card.new(question: element, answer: element)
end

dummy_deck = Deck.create(name: "The Dummiest of Test Decks", description: "You know the answer", user: User.find(rand(10) + 1))

['dummy?', 'not dummy?'].each do |element|
  dummy_deck.cards << Card.new(question: element, answer: 'yes')
end

full_alpha_deck = Deck.create(name: "Full Alphabet Deck", description: "Learn your ABCs", user: User.find(rand(10) + 1))

('A'..'Z').to_a.each do |element|
  full_alpha_deck.cards << Card.new(question: element, answer: element)
end

binary_deck = Deck.create(name: "Binary Test Deck", description: "Learn Binary", user: User.find(rand(10) + 1))

['0','1'].each do |element|
  binary_deck.cards << Card.new(question: element, answer: element)
end
