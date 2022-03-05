# Write a method that takes one argument, a string, 
# and returns a new string with the words in reverse order.

# Examples:

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# The tests above should print true.

# input: string
# output: new string
# algorithm:
#   - divide string into substrings
#   - add substrings to array
#   - reverse order of the array
#   - return string with joined array elements

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
