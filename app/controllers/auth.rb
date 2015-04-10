get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.create(params[:user])
  session[:used_id] = user.id
  redirect '/'
end

get '/signin' do
  erb :'auth/signin'
end

post '/signin' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user_id
    redirect '/'
  else
    redirect '/signin'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end
