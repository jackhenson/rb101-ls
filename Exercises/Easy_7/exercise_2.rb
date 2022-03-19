# Write a method that takes a string, and then 
# returns a hash that contains 3 entries: 
# one represents the number of characters in 
# the string that are lowercase letters, one the 
# number of characters that are uppercase letters, 
# and one the number of characters that are neither.

# input: string
# output: hash, 3 entries:
#           - num of lowercase letters in str
#           - num of uppercase letters
#           - num of chars that are neither
# algorithm:
#     - initialize result hash
#     - iterate through string chars
#       - add to hash, depending on char type
#     - return hash

def letter_case_count(str)
  result = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |char|
    if ('a'..'z').to_a.include?(char)
      result[:lowercase] += 1
    elsif ('A'..'Z').to_a.include?(char)
      result[:uppercase] +=1
    else
      result[:neither] += 1
    end
  end

  result
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
