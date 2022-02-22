# CONSTANTS
WINNING_SCORE = 21

# card_values = {'J': 10, 'Q': 10, 'K': 10, ''}

player_hand = []
dealer_hand = []
scores = {player: 0, dealer: 0}

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

def deal_card_player(deck, player_hand)
  player_hand << pick_random_card(deck)
end

def deal_card_dealer(deck, dealer_hand)
  dealer_hand << pick_random_card(deck)
end

def display_dealers_card(dealer_hand)
  prompt "Dealer has: #{dealer_hand[0][1]} and unknown card"
end

def display_players_cards(player_hand)
  prompt "You have: #{player_hand[0][1]} and #{player_hand[1][1]}"
end

def get_player_choice
  prompt "Do you want to hit or stay?"
  prompt "Type 'H' to hit, or 'S' to stay:"
  answer = gets.chomp
    system 'clear'
    case answer.downcase
    when 'h' || 'hit' then return 'hit'
    when 's' || 'stay' then return 'stay'
    else prompt "That's not a valid choice."
end

def players_turn(deck, player_hand)
  loop do
    player_choice = get_player_choice
    if player_choice == 'hit'
      deal_card_player(deck, player_hand)
      return 'bust' if bust?(player)
    else
      return player_score
    end
  end
end

deck = initialize_deck
2.times { |deal| deal_card_player(deck, player_hand) }
2.times { |deal| deal_card_dealer(deck, dealer_hand) }
display_dealers_card(dealer_hand)
display_players_cards(player_hand)
