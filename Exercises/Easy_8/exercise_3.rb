# Write a method that returns a list of all substrings 
# of a string that start at the beginning of the original 
# string. The return value should be arranged in order 
# from shortest to longest substring.

# input: str
# output: arr, substrings of input str
# explicit: sort output arr, short to longest substring
# algorithm:
#     - initialize new result arr
#     - iterate over string chars
#       - append str to result arr, from idx 0 to current idx
#     - return sorted result arr

def leading_substrings(str)
  result = []
  str.chars.each_with_index { |char, idx| result << str[0, idx+1] }
  result.sort
end


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
