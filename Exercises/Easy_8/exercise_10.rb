# Write a method that takes a non-empty 
# string argument, and returns the middle 
# character or characters of the argument. 
# If the argument has an odd length, you 
# should return exactly one character. If 
# the argument has an even length, you 
# should return exactly two characters.

# input: str
# output: str, middle char of input str
#       - if input str has odd length, return one char
#       - in input str has even length, return two chars
# algorithm:
#     - if str size is odd
#       - return char at middle str idx
#     - if str size is even
#       - return chars at middle str idxs

def center_of(str)
  center_idx = str.size/2
  str.size.odd? ? str[center_idx] : str[center_idx-1, 2]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
