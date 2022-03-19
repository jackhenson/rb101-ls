# Write a method that takes a string as an argument 
# and returns a new string in which every uppercase 
# letter is replaced by its lowercase version, and 
# every lowercase letter by its uppercase version. 
# All other characters should be unchanged.

# You may not use String#swapcase; write your 
# own version of this method.

# input: string
# output: new string
# explicit: - replace uppercase letters with lowercase, vice versa
#           - ignore other chars
# algorithm:
#       - initialize new result str
#       - iterate through each char
#         - if upper case letter, downcase
#         - if lower case letter, upcase

def swapcase(str)
  result = str.chars.map do |char|
    if ('A'..'Z').to_a.include?(char)
      char.downcase
    elsif ('a'..'z').to_a.include?(char)
      char.upcase
    else
      char
    end
  end

  result.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'