
state_capital_hash = {
  name: "State Capitals",
  description: "Learn the state capitals",
  path: File.expand_path('../seed_data/states.csv', __FILE__)
}

Deck.create_new_deck(state_capital_hash)
