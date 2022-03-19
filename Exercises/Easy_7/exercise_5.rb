# Write a method that takes a String as an argument, 
# and returns a new String that contains the original 
# value using a staggered capitalization scheme in which 
# every other character is capitalized, and the remaining 
# characters are lowercase. Characters that are not letters 
# should not be changed, but count as characters when 
# switching between upper and lowercase.

# input: str
# output: new string, staggered caps
#         - every other char is capitalized
#         - non-letter chars unchanged, but count as chars
# algorithm:
#     - Initialize new str result variable
#     - Iterate through str, append each char to new str
#        - If char is letter
#         - Upcase even index letters
#         - Downcase odd index letter

def staggered_case(str)
  result = ''
  str.chars.each_with_index do |char, idx|
    idx.even? ? result << char.upcase : result << char.downcase
  end
  result
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'