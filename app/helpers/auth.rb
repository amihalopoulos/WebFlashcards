def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def error_message
  msg = flash[:error]
  flash[:error] = nil
  msg
end

def users_deck?(deck)
  current_user == deck.user
end