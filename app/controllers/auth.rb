get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/'
end

get '/signin' do
  erb :'auth/signin'
end

post '/signin' do
  user = User.authenticate(params[:user])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/signin'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end
