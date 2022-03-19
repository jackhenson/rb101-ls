# Write a method that takes an Array of integers as input, 
# multiplies all the numbers together, divides the result 
# by the number of entries in the Array, and then prints 
# the result rounded to 3 decimal places. 
# Assume the array is non-empty.

# input: arr of integers
# output: int
#       - result of multiplying nums together, dividing by num of entries
#       - round result to 3 decimal places
# algorithm:
#   - initialize result variable to 0
#   -

def show_multiplicative_average(arr)
  arr.map!(&:to_f)
  product = format("%.3f", ((arr.inject(&:*))/arr.size))
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667