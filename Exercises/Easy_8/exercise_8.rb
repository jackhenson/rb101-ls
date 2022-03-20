# Write a method that takes a string, and returns 
# a new string in which every consonant character 
# is doubled. Vowels (a,e,i,o,u), digits, punctuation, 
# and whitespace should not be doubled.

# input: str
# output: new str
#         - consonant chars are doubled
#         - vowels, digits, punctuation, whitespace not doubled
# algorithm:
#     - Initialize new result arr
#     - Iterate over each char in input str
#       - if char is consonant, double char and append to result
#       - if char not consonant, append char to result
#     - Join and return arr as str

def double_consonants(str)
  letters = ('a'..'z').to_a
  consonants = letters - ['a','e','i','o','u']
  result = []
  str.chars.each do |char|
    if consonants.include?(char.downcase)
      result << char*2
    else
      result << char
    end
  end

  result.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
