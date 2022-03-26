# Write a method that takes a string as an argument, 
# and returns true if all parentheses in the string 
# are properly balanced, false otherwise. To be properly 
# balanced, parentheses must occur in 
# matching '(' and ')' pairs.

# Note that balanced pairs must each start with a (, not a ).

# input: str
# output: boolean
# algorithm:
#       - initialize variable assigned to empty arr
#       - iterate through str, add parenthases chars to arr
#       - if num of forward and backward parenthases are equal
#         - and begins with forward paren, ends with backwards paren
#         - return true

# FIRST ATTEMPT
# def balanced?(str)
#   parenthases = []
#   str.chars.each {|char| parenthases << char if (char == '(' || char == ')')}
#   if parenthases.count('(') == parenthases.count(')') &&
#      parenthases[0] == '(' && parenthases[-1] == ')'
#      return true
#   elsif parenthases.empty?
#     return true
#   end

#   false
# end

# GIVEN SOLUTION
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

p balanced?('What (is) this?') #== true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false