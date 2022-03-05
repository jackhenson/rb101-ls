# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always 
# starting with 1. The length of the string should match 
# the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# The tests above should print true.

# input: integer, representing length of output string
# output: string of 1s and 0s, length of input integer
# algorithm:
#   - if input integer is even
#     - print string of '10' int/2 times
#   - if input integer is odd
#     - print string of '10' int/2 times + 1

# def stringy(int)
#   new_str = ''
#   if int.even?
#     (int/2).times { new_str << '10'}
#   else
#     (int/2).times { new_str << '10'}
#     new_str << '1'
#   end

#   new_str
# end

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Further Exploration

# Modify stringy so it takes an additional optional 
# argument that defaults to 1. If the method is called
# with this argument set to 0, the method should return
# a String of alternating 0s and 1s, but starting with 
# 0 instead of 1.

def stringy(size, start_num = 1)
  numbers = []

  size.times do |index|
    if start_num == 1
      number = index.even? ? 1 : 0
      numbers << number
    else
      number = index.even? ? 0 : 1
      numbers << number
    end
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(6, start_num=0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'