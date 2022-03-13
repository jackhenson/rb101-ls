# Given a string that consists of some words 
# (all lowercased) and an assortment of 
# non-alphabetic characters, write a method 
# that returns that string with all of the 
# non-alphabetic characters replaced by spaces. 
# If one or more non-alphabetic characters occur 
# in a row, you should only have one space in the 
# result (the result should never have consecutive spaces).

# input: string
# output: string, non-alphabetic characters replaced by spaces
# explicit:
#   - if one or more non-alphabetic characters occur in a row,
#       only have one space in the result
# algorithm:
#   - initialize new empty array
#   - iterate through each character
#     - if alphabetic character
#       - add to the array
#     - if non-alphabetic character
#       - if last character in array is space
#         - next
#       - if last character in array is not a space
#         - add space to array
#   - join array and return new string result

def cleanup(string)
  result = Array.new
  string.chars.each do | char |
    if ('a'..'z').to_a.include?(char.downcase)
      result << char
    elsif result.last != ' '
      result << ' '
    end
  end

  result.join
end

p cleanup("---what's my +*& line?") == ' what s my line '

# GIVEN SOLUTION
# ALPHABET = ('a'..'z').to_a

# def cleanup(text)
#   clean_chars = []

#   text.chars.each do |char|
#     if ALPHABET.include?(char)
#       clean_chars << char
#     else
#       clean_chars << ' ' unless clean_chars.last == ' '
#     end
#   end

#   clean_chars.join
# end