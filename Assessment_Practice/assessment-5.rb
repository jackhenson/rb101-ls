# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

# input: str
# output: string, char that occurs least often in input str
# rules:
#     - if multi chars with equal low num, return one that appears first
#     - when counting chars, consider upper and lowercase the same
#     - spaces count as chars
#     - return lowercase char
# algo:
#     - HIGH LEVEL
#       - Count how much each char appears in input str
#       - Return first char with lowest count
#     - LOW LEVEL
#       - Transform array of str chars to downcase count of downcase input str
#       - Of minimum char counts, return first char

def least_common_char(str)
  str_chars_arr = str.chars
  str_chars_arr.min_by { |char| str.downcase.count(char.downcase)}.downcase
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".