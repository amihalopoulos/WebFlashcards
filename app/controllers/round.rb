require 'byebug'

get '/rounds/new' do
  erb :'rounds/new'
end

post '/rounds/new' do
  params[:deck_id]
  round = Round.create(deck_id: params[:deck_id], user_id: current_user.id)
  # TODO: error handling for round creation
  redirect "/rounds/#{round.id}"
end


get '/rounds/:id' do |id|
  @round = Round.find(id)
  @deck = @round.deck
  @card = @round.next_card
  if @card.nil?
    erb :'rounds/result'
  else
    erb :'rounds/show'
  end
end

post '/rounds/:id' do |id|
  card_id = params[:card_id]
  card = Card.find(card_id)
  correct = params[:answer] == card.answer
  guess = Guess.create(round_id: id, card_id: card_id, correct: correct)
  redirect "/rounds/#{id}"
end
