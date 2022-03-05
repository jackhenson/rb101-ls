# Write a method that takes one argument, a string containing
# one or more words, and returns the given string with words 
# that contain five or more characters reversed. Each string 
# will consist of only letters and spaces. Spaces should be
# included only when more than one word is present.

# Examples:

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# input: str containing 1 or more words
# output: str with words of 5 or more characters reversed
# algorithm
#   - Split str into substrings
#   - Add each sub string to arr
#   - If substring has 5 or more characters, reverse it
#   - Join substrings

def reverse_words(str)
  reversed_words = str.split.map do |word| 
    word.size >= 5 ? word.reverse : word
  end

  reversed_words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS