get '/rounds/:id' do |id|
  @round = Round.find(id)
  @user = User.find(session[:user_id])
  @deck = @round.deck
  cards = @deck.cards
  if session[:cards]
    redirect "/rounds/#{@round.id}/stats" unless session[:cards].length > 0
    @cards = session[:cards]
  else
    @cards = @deck.shuffle(cards).map do |card|
      card.id
    end
    session[:cards] = @cards
  end
  @cur_card = Card.find_by(current_card(@cards))
  if @cur_card
    erb :'round/show'
  else
    redirect "/rounds/#{@round.id}/stats"
    # erb :'round/stats'
  end
end

post '/rounds' do
  deck = Deck.find(params[:deck_id])
  user = User.find(session[:user_id])
  round = Round.create(deck: deck, user: user)
  session[:cards] = nil
  redirect "/rounds/#{round.id}"
end
