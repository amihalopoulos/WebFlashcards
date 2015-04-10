
get '/' do
  erb :welcome
end

get '/signin' do
  erb :'/auth/signin'
end

post '/signin' do
  @user = User.find_by(name: params[:name])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    flash[:error] = "Invalid username/password"
    redirect '/signin'
  end
end

get '/signup' do
  erb :'/auth/signup'
end

post '/signup' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  if @user.valid?  #is this a good way to authenticate a user?
    redirect '/'
  else
    redirect '/signup'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end


