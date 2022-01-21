VALID_CHOICES = %w(rock paper scissors lizard Spock)
WIN_VALS = { 'rock' => ['scissors', 'lizard'],
             'paper' => ['rock', 'Spock'],
             'scissors' => ['paper', 'lizard'],
             'lizard' => ['paper', 'Spock'],
             'Spock' => ['rock', 'scissors'] }
COUNT_TO_WIN = 3
RULES = <<-MSG
  Scissors cuts paper,
  paper covers rock,
  rock crushes lizard,
  lizard poisons Spock,
  Spock smashes scissors,
  scissors decapitates lizard,
  lizard eats paper,
  paper disproves Spock,
  Spock vaporizes rock,
  rock crushes scissors.
MSG

scores = { player: 0, computer: 0, ties: 0 }

def prompt(message)
  puts "=> #{message}"
end

def display_greeting
  prompt("Welcome to the Rock, Paper, Scissors, Lizard, Spock!")
  prompt("First player with #{COUNT_TO_WIN} wins takes the match. Good luck!")
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
end

def get_user_choice
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.
          Type 'r' for rock, 'p' for paper, 'sc' for scissors,
          'l' for lizard, or 'sp' for Spock:")
    user_choice_abbrev = gets.chomp

    return 'rock' if user_choice_abbrev.downcase == 'r'
    return 'paper' if user_choice_abbrev.downcase == 'p'
    return 'scissors' if user_choice_abbrev.downcase == 'sc'
    return 'lizard' if user_choice_abbrev.downcase == 'l'
    if user_choice_abbrev.downcase == 'sp'
      return 'Spock'
    else
      prompt("That's not a valid choice.")
    end
  end
end

def win?(player, computer, win_vals)
  win_vals[player].include?(computer)
end

def display_results(player, computer, win_vals)
  prompt("You chose: #{player}; Computer chose: #{computer}.")
  if win?(player, computer, win_vals)
    prompt("You won!")
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt("Computer won!")
  end
end

def update_score(player, computer, win_vals, scores)
  if win?(player, computer, win_vals)
    scores[:player] += 1
  elsif player == computer
    scores[:ties] += 1
  else
    scores[:computer] += 1
  end
end

def display_score(scores)
  prompt("Score is Player: #{scores[:player]}, Computer: #{scores[:computer]}
         Ties: #{scores[:ties]}")

  if scores[:player] >= COUNT_TO_WIN
    prompt("You've scored #{COUNT_TO_WIN} times.
          You've won the match! Congratulations!")
  elsif scores[:computer] >= COUNT_TO_WIN
    prompt("The computer has scored #{COUNT_TO_WIN} times.
          You've lost the match!")
  end
end

def max_score_reached?(scores)
  scores[:player] == COUNT_TO_WIN || scores[:computer] == COUNT_TO_WIN
end

def clear_scores(scores)
  scores[:player] = 0
  scores[:computer] = 0
  scores[:ties] = 0
end

def play_again?
  loop do
    prompt("Do you want to play again?")
    prompt("Type 'Y' for yes or 'N' for no:")
    answer = gets.chomp
    system 'clear'
    if answer.downcase == 'y' || answer.downcase == 'yes'
      return answer
    elsif answer.downcase == 'n' || answer.downcase == 'no'
      break
    else
      prompt("That's not a valid choice.")
    end
  end
end

def display_goodbye
  prompt("Thank you for playing! Goodbye.")
end

system 'clear'
display_greeting
display_rules

loop do # main loop
  user_choice = get_user_choice
  comp_choice = VALID_CHOICES.sample
  system 'clear'
  update_score(user_choice, comp_choice, WIN_VALS, scores)
  display_results(user_choice, comp_choice, WIN_VALS)
  display_score(scores)
  if max_score_reached?(scores)
    clear_scores(scores)
    break unless play_again?
  end
end

display_goodbye
