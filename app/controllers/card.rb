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