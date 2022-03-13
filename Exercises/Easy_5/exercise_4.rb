# Given a string of words separated by spaces, 
# write a method that takes this string of words 
# and returns a string in which the first and last 
# letters of every word are swapped.

# You may assume that every word contains at least 
# one letter, and that the string will always contain 
# at least one word. You may also assume that each 
# string contains nothing but words and spaces

# input: string
# output: string, first and last letters of each word swapped
# algorithm:
#   - initialize empty array
#   - add each word to the array
#   - iterate through each word, swapping letters

# FIRST ATTEMPT
# def swap(string)
#   words = string.split
#   words.map! do |word|
#     word.chars.map do |char|
#       if char == word[0]
#         char = word[-1]
#       elsif char == word[-1]
#         char = word[0]
#       else
#         char
#       end
#     end
#   end

#   words.map { |word| word.join }.join(' ')
# end

# GIVEN SOLUTION
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'