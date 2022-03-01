WINNING_SCORE = 21
RULES = <<-MSG
  Goal: Get as close to 21 as possible, without going over.  
  You are the playing the dealer, you will both be dealt two cards.
  After this, you will choose to "hit" (dealt another card), or
  "stay", ending your turn.
  
  Numbered cards are worth their face value.
  Jacks, Queens, and Kings are worth 10.
  Aces are worth 1 or 11, depending on your hand's total score.
MSG

def prompt(msg)
  puts "=> #{msg}"
end

def continue
  prompt "Press Enter to continue"
  gets
end

def display_greeting
  prompt "Welcome to Twenty-One!"
  prompt "First player to win 5 rounds wins!"
end

def display_rules
  loop do
    prompt("Would you like to see the rules? (Type 'Y' for yes, 'N' for no.)")
    answer = gets.chomp
    system 'clear'
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
  system 'clear'
  prompt "Dealing cards..."
  sleep 1
  system 'clear'
  2.times { |deal| deal_card_player(deck, player_hand) }
  2.times { |deal| deal_card_dealer(deck, dealer_hand) }
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

def display_dealers_cards(dealer_hand)
  cards = []

  dealer_hand.each do |card|
    cards << expand_name(card[1])
  end
  
  case dealer_hand.length
  when 2 then prompt "Dealer has: #{cards[0]} and unknown card"
  when 3 then prompt "Dealer has: #{cards[0]}, #{cards[2]}, and unknown card"
  when 4 then prompt "Dealer has: #{cards[0]}, #{cards[2]}, #{cards[3]}, and unknown card"
  when 5 then prompt "Dealer has: #{cards[0]}, #{cards[2]}, #{cards[3]}, #{cards[4]}, and unknown card"
  end
end

def display_all_dealer_cards(dealer_hand)
  system 'clear'
  cards = []

  dealer_hand.each do |card|
    cards << expand_name(card[1])
  end

  hidden_card = cards[1]
  case dealer_hand.length
  when 2 then prompt "Dealer has: #{cards[0]} and #{hidden_card}"
  when 3 then prompt "Dealer has: #{cards[0]}, #{cards[2]}, and #{hidden_card}"
  when 4 then prompt "Dealer has: #{cards[0]}, #{cards[2]}, #{cards[3]}, and #{hidden_card}"
  when 5 then prompt "Dealer has: #{cards[0]}, #{cards[2]}, #{cards[3]}, #{cards[4]}, and #{hidden_card}"
  end
end

def display_players_cards(player_hand, scores)
  cards = []

  player_hand.each do |card|
    cards << expand_name(card[1])
  end

  case player_hand.length
  when 2 then prompt "You have: #{cards[0]} and #{cards[1]}"
  when 3 then prompt "You have: #{cards[0]}, #{cards[1]}, and #{cards[2]}"
  when 4 then prompt "You have: #{cards[0]}, #{cards[1]}, #{cards[2]}, and #{cards[3]}"
  when 5 then prompt "You have: #{cards[0]}, #{cards[1]}, #{cards[2]}, #{cards[3]}, and #{cards[4]}"
  end
end

def display_player_total(scores)
  puts ""
  puts "=============="
  prompt "Your current total: #{scores[:player]}"
  puts "=============="
  puts ""
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

def update_scores(player_hand, dealer_hand, scores)
  update_player_score(player_hand, scores)
  update_dealer_score(dealer_hand, scores)
end

def update_player_score(player_hand, scores)
  values = player_hand.map { |card| card[1] }
  
  player_score = 0
  values.each do |value|
    if value == "A"
      player_score += 11
    elsif value.to_i == 0 # J, Q, K
      player_score += 10
    else
      player_score += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    player_score -= 10 if player_score > 21
  end

  scores[:player] = player_score
end

def update_dealer_score(dealer_hand, scores)
  values = dealer_hand.map { |card| card[1] }
  
  dealer_score = 0
  values.each do |value|
    if value == "A"
      dealer_score += 11
    elsif value.to_i == 0 # J, Q, K
      dealer_score += 10
    else
      dealer_score += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    dealer_score -= 10 if dealer_score > 21
  end

  scores[:dealer] = dealer_score
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
end

def players_turn(deck, player_hand, scores)
  loop do
    player_choice = get_player_choice
    if player_choice == 'hit'
      system 'clear'
      prompt "You hit!"
      prompt "Dealing card..."
      sleep 1
      system 'clear'
      deal_card_player(deck, player_hand)
      update_player_score(player_hand, scores)
      display_players_cards(player_hand, scores)
      display_player_total(scores)
      break if busted?(scores)
    elsif player_choice == 'stay'
      break
    end
  end

  busted?(scores) ? prompt('You busted!') : prompt("You chose to stay!")
  continue
  system 'clear'
end

def dealers_turn(deck, dealer_hand, scores)
  until scores[:dealer] >= 17
    prompt "Dealer chose to hit!"
    prompt "Dealing card..."
    sleep 1
    puts ''
    deal_card_dealer(deck, dealer_hand)
    display_all_dealer_cards(dealer_hand)
    update_dealer_score(dealer_hand, scores)
  end

  busted?(scores) ? prompt('Dealer busted!') : prompt("Dealer chose to stay!")
  continue
  system 'clear'
end

def busted?(scores)
  scores[:player] > WINNING_SCORE || scores[:dealer] > WINNING_SCORE
end

def determine_winner(scores)
  if scores[:player] > 21
    'Dealer'
  elsif scores[:dealer] > 21 
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

def display_match_score(matches_won)
  puts "=============="
  prompt "Current Match Total"
  prompt "Player: #{matches_won[:player]}. Dealer: #{matches_won[:dealer]}. Ties: #{matches_won[:tie]}"
  puts "=============="
  puts ""
  continue
  system 'clear'
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
  system 'clear'
end

def play_again?
  loop do
    prompt("Do you want to play again?")
    prompt("Type 'Y' for yes or 'N' for no:")
    answer = gets.chomp
    system 'clear'
    if answer.downcase == 'y' || answer.downcase == 'yes'
      return true
    elsif answer.downcase == 'n' || answer.downcase == 'no'
      break
    else
      prompt("That's not a valid choice.")
    end
  end
end

def tournament_over?(matches_won)
  matches_won[:player] == 5 || matches_won[:dealer] == 5
end

def determine_tournament_winner(matches_won)
  if matches_won[:player] == 5
    'Player'
  else
    'Dealer'
  end
end

def display_tournament_winner(matches_won)
  prompt "#{determine_tournament_winner(matches_won)} wins the Twenty-One tournament!"
  puts ''
end

def display_goodbye
  prompt("Thank you for playing! Goodbye.")
end

# Begin game

display_greeting
display_rules

loop do
  matches_won = {player: 0, dealer: 0, tie: 0}

  loop do
    deck = initialize_deck
    player_hand = []
    dealer_hand = []
    scores = {player: 0, dealer: 0}

    first_deal(deck, player_hand, dealer_hand)
    update_scores(player_hand, dealer_hand, scores)
    display_dealers_cards(dealer_hand)
    display_players_cards(player_hand, scores)
    display_player_total(scores)
    players_turn(deck, player_hand, scores)
    dealers_turn(deck, dealer_hand, scores) unless busted?(scores)
    display_total_score(scores)
    update_scores(player_hand, dealer_hand, scores)
    display_winner(scores)
    update_match_score(scores, matches_won)
    display_match_score(matches_won)
    break if tournament_over?(matches_won)
  end

  display_tournament_winner(matches_won)
  break unless play_again?
end

display_goodbye