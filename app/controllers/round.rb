get '/rounds/:id' do |id|
  @round = Round.find(id)
  # Temporary Deck retrieval method
  @deck = Deck.find(params[:deck_id])
  @user = current_user
  erb :'rounds/show'
end

post '/rounds' do
  deck = Deck.find(params[:id])
  user = current_user
  round = Round.create(deck: deck, user: user)
  redirect "/rounds/#{round.id}"
end
