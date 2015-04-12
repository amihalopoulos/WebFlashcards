get '/rounds/:id' do |id|
  @round = Round.find(id)
  @user = User.find(session[:user_id])
  # Temporary Deck retrieval method
  # @deck = Deck.find(params[:deck_id])
  @deck = Deck.first
  cards = @deck.cards
  if params[:cards]
    @cards = params[:cards]
  else
    @cards = @deck.shuffle(cards)
    params[:cards] = @cards
  end
  @cur_card = current_card(@cards)
  if @cur_card
    erb :'round/show'
  else
    redirect "/rounds/#{@round.id}/stats"
    # erb :'round/stats'
  end
end

post '/rounds' do
  deck = Deck.find(params[:id])
  user = current_user
  round = Round.create(deck: deck, user: user)
  redirect "/rounds/#{round.id}"
end
