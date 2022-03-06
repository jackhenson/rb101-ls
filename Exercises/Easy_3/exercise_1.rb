# Write a program that solicits 6 numbers from the user, 
# then prints a message that describes whether or not 
# the 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# input: 6 ints, user inputs
# output: display whether the last user int appears in arr of first 5 user ints

def searching
  arr = Array.new

  puts "==> Enter the 1st number:"
  number1 = gets.chomp.to_i
  arr << number1

  puts "==> Enter the 2nd number:"
  number2 = gets.chomp.to_i
  arr << number2

  puts "==> Enter the 3rd number:"
  number3 = gets.chomp.to_i
  arr << number3
  
  puts "==> Enter the 4th number:"
  number4 = gets.chomp.to_i
  arr << number4

  puts "==> Enter the 5th number:"
  number5 = gets.chomp.to_i
  arr << number5

  puts "==> Enter the last number:"
  last_number = gets.chomp.to_i

  if arr.include?(last_number)
    puts "The number #{last_number} appears in #{arr}."
  else
    puts "The number #{last_number} does not appear in #{arr}."
  end
end

searching