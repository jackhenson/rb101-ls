# Create a simple tip calculator. The program 
# should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display 
# both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

# input: 2 user inputs, 1 int (bill amt) 1 int (tip %)
# output: 2 outputs, 1 int (tip dollar amt), total dollar amt
# algorithm
#   - covert tip input to decimal
#   - get tip: multiply tip decimal by bill amount
#   - get total: add tip to total
#   - display both amounts

def tip_calc
  puts "What is the bill?"
  bill = gets.to_f

  puts "What is the tip percentage?"
  tip = gets.to_f

  tip_decimal = tip / 100
  tip_total = (bill * tip_decimal).round(2)
  total_amt = (tip_total + bill).round(2)

  puts "The tip is #{format("$%0.2f", tip_total)}."
  puts "The total is #{format("$%0.2f", total_amt)}."
end

tip_calc