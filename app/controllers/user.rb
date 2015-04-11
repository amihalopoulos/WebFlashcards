
#edit
get '/users/:id/edit' do |id|
  @user = User.find(id)
  erb :'users/edit'
end

put '/users/:id' do |id|
  user = User.find(id)
  user.update(params[:user])
  redirect "/users/#{id}"
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
  @user = User.find(id)
  erb :'users/index'
end
