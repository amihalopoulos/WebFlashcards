require 'csv'

state_capitals_path = File.expand_path('../seed_data/states.csv', __FILE__)

state_capitals_deck = Deck.create(name: 'State Capitals', description: "Learn the state capitals")
File.open(state_capitals_path) do |f|
  f.each_line do |line|
    array = line.chomp.split(',')
    question = array[0].to_s.downcase
    answer = array[1].to_s.downcase
    Card.create(question: question, answer: answer, deck: state_capitals_deck)
  end
end
