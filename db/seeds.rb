require 'faker'

index = 0
10.times do
  index += 1
  User.create(name: Faker::Name.name, email: "#{index}@email.com", password: "123")
end

state_capital_hash = {
  name: "State Capitals",
  description: "Learn the state capitals",
  path: File.expand_path('../seed_data/states.csv', __FILE__)
}

Deck.create_new_deck(state_capital_hash)

world_capital_hash = {
  name: "World Capitals",
  description: "Learn the capitals from around the world",
  path: File.expand_path('../seed_data/country-capitals.csv', __FILE__)
}

Deck.create_new_deck(world_capital_hash)
