# Write a method that takes two strings as arguments, 
# determines the longest of the two strings, and then 
# returns the result of concatenating the shorter string, 
# the longer string, and the shorter string once again. 
# You may assume that the strings are of different lengths.

# Examples:

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# input: 2 strings
# output: new string

# initialize new empty string
# sort input strings by size
# initialize local variables to short str and long str
# concatenate strs to new string in order given

def short_long_short(str1, str2)
  result = ''
  strings = [str1, str2]
  strings.sort_by! { |str| str.size }
  short_str = strings.first
  long_str = strings.last

  result << short_str + long_str + short_str
  result
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"