get '/rounds/:id' do |id|
  @round = Round.find(id)
  erb :'rounds/show'
end

post '/rounds' do
  deck = Deck.find(params[:id])
  # When merge use current user helper method instead of database query
  user = User.find(session[:user_id])
  round = Round.create(deck: deck, user: user)
  redirect "/rounds/#{round.id}"
end
