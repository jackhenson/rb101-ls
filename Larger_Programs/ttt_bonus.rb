require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

COUNT_TO_WIN = 5

scores = { player: 0, computer: 0, ties: 0 }

def prompt(msg)
  puts " => #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}   "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

# def computer_places_piece!(brd)
#   square = nil
#   WINNING_LINES.each do |line|
#     square = find_winning_square(line, brd)
#     break if square
#   end

#   if !square
#     WINNING_LINES.each do |line|
#       square = find_at_risk_square(line, brd)
#       break if square
#     end
#   end

#   if !square
#     if brd[5] == INITIAL_MARKER
#       square = 5
#     else
#       square = empty_squares(brd).sample
#     end
#   end

#   brd[square] = COMPUTER_MARKER
# end

def computer_places_piece!(brd)
  square = nil
  loop do
    WINNING_LINES.each do |line|
      square = find_winning_square(line, brd)
      break if square
    end
    break square if square

    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd)
      break if square
    end
    break square if square

    break square = 5 if brd[5] == INITIAL_MARKER
    break square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  elsif current_player == 'Computer'
    computer_places_piece!(brd)
    display_board(brd)
  end
end

def find_at_risk_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def find_winning_square(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # !! forcibly turns value into boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end

  nil
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def update_score(winner, scores)
  if winner == 'Player'
    scores[:player] += 1
  elsif winner == 'Computer'
    scores[:computer] += 1
  else
    scores[:ties] += 1
  end
end

def display_results(winner)
  if winner == 'Player' || winner == 'Computer'
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
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
    prompt "Do you want to play again?"
    prompt "Type 'Y' for yes or 'N' for no:"
    answer = gets.chomp
    system 'clear'
    if answer.downcase == 'y' || answer.downcase == 'yes'
      return true
    elsif answer.downcase == 'n' || answer.downcase == 'no'
      break false
    else
      prompt "That's not a valid choice."
    end
  end
end

def continue_playing
  prompt "Press any key to continue..."
  gets.chomp
end

def display_welcome
  prompt "Welcome to Tic Tac Toe!"
  prompt "First to win 5 games wins the match!"
  prompt ""
end

def choose_first_player
  loop do
    prompt "Who will play first?"
    prompt "Type 'P' for player or 'C' for computer"
    prompt "Type 'X' to let the computer choose:"
    answer = gets.chomp
    system 'clear'
    case answer.downcase
    when 'p' || 'player' then return 'Player'
    when 'c' || 'computer' then return 'Computer'
    when 'x' then return ['Player', 'Computer'].sample
    else prompt "That's not a valid choice."
    end
  end
end

def alternate_player(current_player)
  if current_player == 'Player'
    'Computer'
  elsif current_player == 'Computer'
    'Player'
  end
end

def display_goodbye
  prompt "Thanks for playing Tic Tac Toe! Goodbye."
end

display_welcome
first_player = choose_first_player

loop do
  board = initialize_board
  current_player = first_player

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  update_score(detect_winner(board), scores)
  display_results(detect_winner(board))
  display_score(scores)
  if max_score_reached?(scores)
    clear_scores(scores)
    break unless play_again?
  end
  continue_playing
end

display_goodbye
