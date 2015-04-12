get '/deck/new' do
  if current_user
    erb :'/deck/new'
  else
    flash[:error] = "You must log in to perform that action!"
    redirect '/'
  end
end

post '/deck/new' do
  user = User.find(session[:user_id])
  @deck = user.decks.create(params[:deck])

  erb :'/deck/show'
end

get '/deck/:id' do |id|
  @deck = Deck.find(id)
  @author = users_deck?(@deck) ? true : false
  erb :'/deck/show'
end




