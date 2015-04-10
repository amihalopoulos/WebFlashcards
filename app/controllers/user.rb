get '/user/:id' do

  erb :'users/index'
end


#edit
put '/user/:id' do
  user = User.find(params[:id])
  user.update(params[:user])
  redirect '/user/:id'
end

#delete
delete '/user/:id' do
  user = User.find(params[:id])
  user.destroy
  redirect '/'
end

get '/user/:id/history' do
  @user = User.find(id)
  erb :'users/history'
end
