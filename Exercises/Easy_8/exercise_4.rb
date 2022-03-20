# Write a method that returns a list of all 
# substrings of a string. The returned list 
# should be ordered by where in the string 
# the substring begins. This means that all 
# substrings that start at position 0 should 
# come first, then all substrings that start 
# at position 1, and so on. Since multiple 
# substrings will occur at each position, the 
# substrings at a given position should be 
# returned in order from shortest to longest.

# You may (and should) use the leading_substrings 
# method you wrote in the previous exercise

# algorithm:
#     - Iterate through the input str
#       - For each index, return leading substrings

def leading_substrings(str)
  result = []
  str.chars.each_with_index { |char, idx| result << str[0, idx+1] }
  result.sort
end

def substrings(str)
  substrings = []
  str.chars.each_with_index do |char, idx|
    substrings += leading_substrings(str[idx, str.size])
  end

  substrings
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]