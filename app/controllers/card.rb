get '/card/new' do
  @deck = Deck.find_by(params[:deck])
  if users_deck?(@deck)
    erb :'/card/new'
  else
    flash[:error] = "You cannot add cards to another user's deck!"
    redirect '/'
  end
end

post '/card/new' do
  @deck = Deck.find_by(params[:deck])
  if users_deck?(@deck)
    @deck.cards.create(params[:card])
  end

  erb :'/deck/show'
end

get '/card/:id/edit' do |id|
  @card = Card.find(id)
  if users_deck?(@card.deck)
    erb :'/card/edit'
  else
    redirect '/'
  end
end

put '/card/:id' do |id|
  @card = Card.find(id)
  @card.update(params[:card])

  redirect "/deck/#{@card.deck.id}"
end