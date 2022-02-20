def initialize_deck
  new_deck = []
  suit_set = ('1'..'9').to_a << 'jack' << 'queen' << 'king' << 'ace'
  heart_suit = suit_set.map {|card| card << ' of hearts'}
  diamond_suit = suit_set.map {|card| card << ' of diamonds'}
  club_suit = suit_set.map {|card| card << ' of clubs'}
  spade_suit = suit_set.map {|card| card << ' of spades'}
  new_deck << (heart_suit + diamond_suit + club_suit + spade_suit)
  new_deck.flatten
end

new_deck = initialize_deck
p new_deck.size