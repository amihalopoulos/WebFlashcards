joe = User.create(name: 'Joe', password: '1234')
lisa = User.create(name: 'Lisa', password: '1234')

deck = Deck.create(topic: 'Arabic', user: joe)

Card.create(term: 'hello', description: 'marhaba', deck: deck)
Card.create(term: 'welcome', description: 'ahlan wa sahlan', deck: deck)
Card.create(term: 'student', description: 'al jameat', deck: deck)

Round.create(deck: deck, user: lisa)
