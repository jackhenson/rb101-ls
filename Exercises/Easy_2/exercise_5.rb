# Write a program that will ask for user's name. 
# The program will then greet the user. If the 
# user writes "name!" then the computer yells back to the user.

# Examples

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# input: 1 user input, str
# output: str

def greeting
  puts "What is your name?"
  name = gets.chomp

  if name.include?('!')
    puts "Hello #{name.chop}. Why are we screaming?".upcase
  else
    puts "Hello #{name}."
  end
end

greeting