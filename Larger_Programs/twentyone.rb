# CONSTANTS
WINNING_SCORE = 21

# card_values = {'J': 10, 'Q': 10, 'K': 10, ''}

player_hand = []
dealer_hand = []

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = []
  card_values = ('1'..'9').to_a + ['J', 'Q', 'K', 'A']
  card_suits = ['H', 'D', 'C', 'S']
  card_values.each do |value|
    card_suits.each do |suit|
      new_deck << [suit, value]
    end
  end

  new_deck
end

def pick_random_card(deck)
  random_card = deck.sample
  deck.delete(random_card)
  random_card
end

def deal_card(deck, player_hand, dealer_hand)
  player_hand << pick_random_card(deck)
  dealer_hand << pick_random_card(deck)
end

def display_dealers_card(dealer_hand)
  prompt "Dealer has: #{dealer_hand[0][1]} and unknown card"
end

def display_players_cards(player_hand)
  prompt "You have: #{player_hand[0][1]} and #{player_hand[1][1]}"
end

deck = initialize_deck
2.times { |deal| deal_card(deck, player_hand, dealer_hand) }
display_dealers_card(dealer_hand)
display_players_cards(player_hand)