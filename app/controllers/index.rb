get '/' do
  if current_user
    @decks = Deck.all
    erb :index
  else
    redirect '/signin'
  end
end
