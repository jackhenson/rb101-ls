# The goal of this exercise is to convert a string 
# to a new string where each character in the new 
# string is "(" if that character appears only once 
# in the original string, or ")" if that character 
# appears more than once in the original string. 
# Ignore capitalization when determining if a 
# character is a duplicate.

# p duplicate_encode("din") ==  "((("
# p duplicate_encode("recede") == "()()()"
# p duplicate_encode("Success") == ")())())"
# p duplicate_encode("(( @") == "))((" 

# input: str
# output: new str, with '(' or ')'
# algorithm:
#     - iterate and transform each char
#       - if char count in input is > 1, '('
#       - else ')'
#     - join and return

def duplicate_encode(word)
  word = word.downcase
  word.chars.map do |char|
    if word.count(char) > 1
      ')'
    else
      '('
    end
  end.join
end

p duplicate_encode("din") ==  "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))((" 