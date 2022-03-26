# In the easy exercises, we worked on a problem 
# where we had to count the number of uppercase and 
# lowercase characters, as well as characters that 
# were neither of those two. Now we want to go 
# one step further.

# Write a method that takes a string, and then 
# returns a hash that contains 3 entries: one 
# represents the percentage of characters in 
# the string that are lowercase letters, one 
# the percentage of characters that are uppercase 
# letters, and one the percentage of characters 
# that are neither.

# You may assume that the string will always 
# contain at least one character.

# input: str
# output: hsh, 3 entries: 
#               - % of chars that are lowercase letters
#               - % of chars that are uppercase
#               - % of chars that are neither
# algorithm:
#       - initialize constants for uppercase and lowercase chars
#       - initialize result hash
#       - initialize lowercase, uppercase, neither variables assigned to int 0
#       - initialize total variable assigned to str.size
#       - iterate over input str chars
#         - depending on char type, add 1 to lowercase, uppercase, neither variables
#       - calculate avg, add to result hash

UPCASE_CHARS = ('A'..'Z').to_a
DOWNCASE_CHARS = ('a'..'z').to_a

def letter_percentages(str)
  lowercase = 0
  uppercase = 0
  neither = 0
  total_chars = str.size
  str.chars.each do |char|
    if UPCASE_CHARS.include? char
      uppercase += 1
    elsif DOWNCASE_CHARS.include? char
      lowercase += 1
    else
      neither += 1
    end
  end
 
  result = { lowercase: (lowercase.to_f / total_chars.to_f * 100),
             uppercase: (uppercase.to_f / total_chars.to_f * 100),
             neither: (neither.to_f / total_chars.to_f * 100) }
end

p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }