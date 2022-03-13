# Write a method that takes a string argument and 
# returns a new string that contains the value of 
# the original string with all consecutive duplicate 
# characters collapsed into a single character. You 
# may not use String#squeeze or String#squeeze!.

# input: string
# output: new string, consecutive duplicate characters collapsed into a single character
# algorithm
#   - initialize empty array
#   - iterate over each character in input string
#       - if not equal to last character of array
#         - add character to array
#       - if equal to last character of array
#         - skip
#   - join array and return new string

def crunch(string)
  result = []
  string.chars.each do |char|
    result << char if char != result.last
  end

  result.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''