# Write another method that returns true if the string passed as 
# an argument is a palindrome, false otherwise. This time, however, 
# your method should be case-insensitive, and it should ignore all 
# non-alphanumeric characters. If you wish, you may simplify things 
# by calling the palindrome? method you wrote in the previous exercise.

  # Examples:
  
  # real_palindrome?('madam') == true
  # real_palindrome?('Madam') == true           # (case does not matter)
  # real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
  # real_palindrome?('356653') == true
  # real_palindrome?('356a653') == true
  # real_palindrome?('123ab321') == false

# input: str
# output: boolean
# algorithm:
#   - initialize local variable to empty arr
#   - split str characters into a new arr
#   - iterate through characters
#     - append alphanumeric characters to empty arr
#   - join characters in arr to new string
#   - check new string for palindrome?

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(str)
  new_arr = []
  alphanumeric_chars = (0..9).to_a + ('A'..'Z').to_a + ('a'..'z').to_a
  
  str.downcase.chars.each {|char| new_arr << char if alphanumeric_chars.include?(char)}

  palindrome?(new_arr.join)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false