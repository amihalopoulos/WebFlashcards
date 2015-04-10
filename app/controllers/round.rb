get '/rounds/new' do

  erb :'rounds/new'
end

post 'rounds/new' do
  round = Round.create(params[:round])
  redirect '/rounds/:id'
end


get '/rounds/:id' do |id|
  # round id

  erb :'rounds/show'
end

post 'rounds/:id' do

  redirect '/rounds/:id'
end
