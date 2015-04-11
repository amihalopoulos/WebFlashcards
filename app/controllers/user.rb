
#edit
put '/users/:id' do |id|
  user = User.find(id)
  user.update(params[:user])
  redirect "/user/#{id}"
end

#delete
delete '/users/:id' do |id|
  user = User.find(id)
  user.destroy
  redirect '/'
end

get '/users/:id/history' do |id|
  @user = User.find(id)
  erb :'users/history'
end

get '/users/:id' do |id|
  erb :'users/index'
end
