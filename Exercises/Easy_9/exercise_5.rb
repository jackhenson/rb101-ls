# Write a method that takes a string argument, 
# and returns true if all of the alphabetic 
# characters inside the string are uppercase, 
# false otherwise. Characters that are not 
# alphabetic should be ignored.

# input: str
# output: boolean, 
# explicit: - true if all alpha chars in input str are upcase
#           - false otherwise
#           - ignore non alphabetic chars
# algorithm:
#       - 

def uppercase?(str)
  str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
