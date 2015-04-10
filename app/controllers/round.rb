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


  erb :'rounds/show'
end

post 'rounds/:id' do

  redirect '/rounds/:id'
end
