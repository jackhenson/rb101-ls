# Write a method that takes one argument, a positive integer,
# and returns a list of the digits in the number.

# Examples:

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# input: pos integer
# output: array, list of each digit
# data structure: array
# algorithm:
#   - transform num to string
#   - transform string to array, each number as element
#   - transform array, returning new array with integer elements
#   - return result array

# def digit_list(num)
#   arr = num.to_s.chars.map {|char| char.to_i}
# end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true