# Write a program that asks the user to enter an integer greater 
# than 0, then asks if the user wants to determine the sum or product 
# of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# input: int > 0, user input
# output: int representing the sum of product of ints between 1 and input int
# algorithm:
#     - get user input, int > 0
#     - get user input, determine whether to calculate sum or product
#     - if calc sum, sum ints between 1 and input
#     - if calc product, multiply ints between 1 and input
#     - display result

def sum_or_product
  puts ">> Please enter an integer greater than 0:"
  user_int = gets.to_i

  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  user_operator = gets.chomp

  if user_operator == 's'
    result = (1..user_int).inject(&:+)
    puts "The sum of the integers between 1 and #{user_int} is #{result}."
  else
    result = (1..user_int).inject(&:*)
    puts "The product of the integers between 1 and #{user_int} is #{result}."
  end
end

sum_or_product