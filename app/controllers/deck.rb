get '/deck/:id' do |id|
  @deck = Deck.find(id) #find deck of current user with id
  @author = users_deck?(@deck) ? true : false
    #show with edits/delete
  #else
    #show as is
  erb :'/deck/show'
end