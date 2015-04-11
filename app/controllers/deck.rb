get '/decks/new' do
  erb :'decks/new'
end

post '/decks/new' do
  params[:deck][:path] = params[:deck][:file][:tempfile]
  Deck.create_new_deck(params[:deck])
  redirect '/'
end

#edit
get '/decks/:id/edit' do |id|
  @deck = Deck.find(id)
  erb :'decks/edit'
end

put '/decks/:id' do |id|
  deck = Deck.find(id)
  deck.update(params[:deck])
  redirect "/decks/#{id}"
end

#delete
delete '/decks/:id' do |id|
  deck = Dser.find(id)
  deck.destroy
  redirect '/'
end
