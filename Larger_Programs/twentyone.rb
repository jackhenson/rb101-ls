# Constants

WINNING_SCORE = 21
DEALER_HIT_MAX = 17
SLEEP_DURATION = 1
RULES = <<-MSG
  Goal: Get as close to 21 as possible, without going over.  
  You are the playing the dealer, you will both be dealt two cards.
  After this, you will choose to "hit" (dealt another card), or
  "stay", ending your turn.
  
  Numbered cards are worth their face value.
  Jacks, Queens, and Kings are worth 10.
  Aces are worth 1 or 11, depending on your hand's total score.
MSG

# Auxillary methods

def prompt(msg)
  puts "=> #{msg}"
end

def continue
  prompt "Press Enter to continue"
  gets
end

def clear_screen
  system 'clear'
end

def play_again?
  loop do
    prompt("Do you want to play again?")
    prompt("Type 'Y' for yes or 'N' for no:")
    answer = gets.chomp
    clear_screen
    if answer.downcase == 'y' || answer.downcase == 'yes'
      return true
    elsif answer.downcase == 'n' || answer.downcase == 'no'
      break
    else
      prompt("That's not a valid choice.")
    end
  end
end

# Display

def display_greeting
  prompt "Welcome to Twenty-One!"
  prompt "First player to win 5 rounds wins!"
end

def display_rules
  loop do
    prompt("Would you like to see the rules? (Type 'Y' for yes, 'N' for no.)")
    answer = gets.chomp
    clear_screen
    if answer.downcase == 'y' || answer.downcase == 'yes'
      puts RULES
      break
    elsif answer.downcase == 'n' || answer.downcase == 'no'
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  continue
end

def display_cards(player_hand, dealer_hand)
  display_dealers_cards(dealer_hand, hide_dealer_card: true)
  display_players_cards(player_hand)
end

def display_dealers_cards(dealer_hand, hide_dealer_card: false)
  display_hidden_dealer_cards(dealer_hand) if hide_dealer_card
  display_all_dealer_cards(dealer_hand) if !hide_dealer_card
end

def display_hidden_dealer_cards(dealer_hand)
  cards = 'Dealer has: '

  dealer_hand.each do |card|
    if dealer_hand.first == card
      next
    else
      cards << expand_name(card[1]) + ' '
    end
  end

  prompt cards + 'and hidden card'
end

def display_all_dealer_cards(dealer_hand)
  cards = 'Dealer has: '

  dealer_hand.each do |card|
    cards << if dealer_hand.last == card
               'and ' + expand_name(card[1])
             elsif dealer_hand.size == 2
               expand_name(card[1]) + ' '
             else
               expand_name(card[1]) + ', '
             end
  end

  prompt cards
end

def display_players_cards(player_hand)
  cards = 'You have: '

  player_hand.each do |card|
    cards << if player_hand.last == card
               'and ' + expand_name(card[1])
             elsif player_hand.size == 2
               expand_name(card[1]) + ' '
             else
               expand_name(card[1]) + ', '
             end
  end

  prompt cards
end

def display_player_total(scores)
  puts ""
  puts "=============="
  prompt "Your current total: #{scores[:player]}"
  puts "=============="
  puts ""
end

def display_player_hit_results(player_hand, scores)
  display_players_cards(player_hand)
  display_player_total(scores)
end

def display_players_turn_results(scores)
  busted?(scores) ? prompt('You busted!') : prompt("You chose to stay!")
end

def display_dealers_turn_results(scores)
  busted?(scores) ? prompt('Dealer busted!') : prompt("Dealer chose to stay!")
end

def display_match_score(matches_won)
  player = matches_won[:player]
  dealer = matches_won[:dealer]
  tie = matches_won[:tie]
  puts "=============="
  prompt "Current Match Total"
  prompt "Player: #{player}. Dealer: #{dealer}. Ties: #{tie}"
  puts "=============="
  puts ""
  continue
  clear_screen
end

def display_total_score(scores)
  puts ""
  puts "=============="
  prompt "Player total: #{scores[:player]}. Dealer total: #{scores[:dealer]}"
  puts "=============="
  puts ""
end

def display_winner(scores)
  if determine_winner(scores) == 'Tie'
    prompt "It's a tie!"
  else
    prompt "#{determine_winner(scores)} wins!"
  end
  continue
  clear_screen
end

def display_tournament_winner(matches_won)
  tournament_winner = determine_tournament_winner(matches_won)
  prompt "#{tournament_winner} wins the Twenty-One tournament!"
  puts ''
end

def display_goodbye
  prompt("Thank you for playing! Goodbye.")
end

# Player action

def player_choice
  prompt "Do you want to hit or stay?"
  prompt "Type 'H' to hit, or 'S' to stay:"
  answer = gets.chomp
  clear_screen
  case answer.downcase
  when 'h' || 'hit' then 'hit'
  when 's' || 'stay' then 'stay'
  else prompt "That's not a valid choice."
  end
end

def players_turn(deck, player_hand, scores)
  loop do
    player_move = player_choice
    if player_move == 'hit'
      player_hits(deck, player_hand)
      update_player_score(player_hand, scores)
      display_player_hit_results(player_hand, scores)
      break if scores[:player] == WINNING_SCORE
      break if busted?(scores)
    elsif player_move == 'stay'
      break
    end
  end

  display_players_turn_results(scores)
  continue
  clear_screen
end

def player_hits(deck, player_hand)
  clear_screen
  prompt "You hit!"
  prompt "Dealing card..."
  sleep SLEEP_DURATION
  clear_screen
  deal_card_player(deck, player_hand)
end

# Dealer actions

def dealers_turn(deck, dealer_hand, scores)
  until scores[:dealer] >= DEALER_HIT_MAX
    prompt "Dealer chose to hit!"
    prompt "Dealing card..."
    sleep SLEEP_DURATION
    puts ''
    deal_card_dealer(deck, dealer_hand)
    display_all_dealer_cards(dealer_hand)
    update_dealer_score(dealer_hand, scores)
  end

  display_dealers_turn_results(scores)
  continue
  clear_screen
end

# Deck and dealing

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

def first_deal(deck, player_hand, dealer_hand)
  clear_screen
  prompt "Dealing cards..."
  sleep SLEEP_DURATION
  clear_screen
  2.times { deal_card_player(deck, player_hand) }
  2.times { deal_card_dealer(deck, dealer_hand) }
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

def expand_name(card)
  case card
  when 'J' then card = 'Jack'
  when 'Q' then card = 'Queen'
  when 'K' then card = 'King'
  when 'A' then card = 'Ace'
  end

  card
end

# Scorekeeping

def update_scores(player_hand, dealer_hand, scores)
  update_player_score(player_hand, scores)
  update_dealer_score(dealer_hand, scores)
end

def update_player_score(player_hand, scores)
  values = player_hand.map { |card| card[1] }

  player_score = 0
  values.each do |value|
    player_score += if value == "A"
                      11
                    elsif value.to_i == 0 # J, Q, K
                      10
                    else
                      value.to_i
                    end
  end

  values.select { |value| value == "A" }.count.times do
    player_score -= 10 if player_score > WINNING_SCORE
  end

  scores[:player] = player_score
end

def update_dealer_score(dealer_hand, scores)
  values = dealer_hand.map { |card| card[1] }

  dealer_score = 0
  values.each do |value|
    dealer_score += if value == "A"
                      11
                    elsif value.to_i == 0 # J, Q, K
                      10
                    else
                      value.to_i
                    end
  end

  values.select { |value| value == "A" }.count.times do
    dealer_score -= 10 if dealer_score > WINNING_SCORE
  end

  scores[:dealer] = dealer_score
end

def busted?(scores)
  scores[:player] > WINNING_SCORE || scores[:dealer] > WINNING_SCORE
end

def determine_winner(scores)
  if scores[:player] > WINNING_SCORE
    'Dealer'
  elsif scores[:dealer] > WINNING_SCORE
    'Player'
  elsif scores[:player] > scores[:dealer]
    'Player'
  elsif scores[:dealer] > scores[:player]
    'Dealer'
  else
    'Tie'
  end
end

def update_match_score(scores, matches_won)
  if determine_winner(scores) == 'Tie'
    matches_won[:tie] += 1
  else
    matches_won[determine_winner(scores).downcase.to_sym] += 1
  end
end

def determine_tournament_winner(matches_won)
  if matches_won[:player] == 5
    'Player'
  else
    'Dealer'
  end
end

def tournament_over?(matches_won)
  matches_won[:player] == 5 || matches_won[:dealer] == 5
end

# Begin game

display_greeting
display_rules

loop do
  matches_won = { player: 0, dealer: 0, tie: 0 }

  loop do
    deck = initialize_deck
    player_hand = []
    dealer_hand = []
    scores = { player: 0, dealer: 0 }

    first_deal(deck, player_hand, dealer_hand)
    update_scores(player_hand, dealer_hand, scores)
    display_cards(player_hand, dealer_hand)
    display_player_total(scores)
    players_turn(deck, player_hand, scores)
    dealers_turn(deck, dealer_hand, scores) unless busted?(scores)
    display_total_score(scores) unless busted?(scores)
    display_winner(scores)
    update_match_score(scores, matches_won)
    display_match_score(matches_won)
    break if tournament_over?(matches_won)
  end

  display_tournament_winner(matches_won)
  break unless play_again?
end

display_goodbye
