post '/guesses' do
  guess = Guess.new(params[:guess])
  if guess.save
    redirect "/round/#{guess.round_id}"
  else
    redirect back
  end
end
