# Create a simple tip calculator. The program should 
# prompt for a bill amount and a tip rate. The program 
# must compute the tip and then display both the tip 
# and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip = gets.chomp.to_f

tip_amt = (bill * (tip * 0.01)).to_f
total = (bill + tip_amt).round 2

puts "The tip is #{tip_amt}."
puts "The total is #{total}."