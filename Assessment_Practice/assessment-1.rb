# Have the method division_stringified(num1, num2) 
# take both parameters being passed, divide num1 by num2, 
#and return the result as a string with properly formatted commas.
#
# If an answer is only 3 digits long, return the number with no commas.
#
# Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".
#
# Note: 2 divided by 3 should return '1'

# input: 2 int
# output: str, representing result of num1 divided by num2
# rules:
#   explicit: 
#       - divide num1 by num2
#       - if answer is only 3 digits long, return number without commas
#       - 2 divided by 3 should return '1'
#   implicit:
#       - round answer up to nearest digit
#   algorithm:
#       - initialize variable, result_digits to num1/num2
#         - if the float return of num1/num2 is greater than 


# # Problem
# - Given two numbers, num1 and num2,
# - Find the result when num1 is divided by num2 (and add 1)
# - Return the result in string, group the number in 3's with a comma
# - If the result is less than 3-digit long, reuturn the number in string with no comma

# # Algorithm
# - Given two numbers, num1 and num2,
#   - Divide num1 by num2 and then add 1
#   - Convert the result to a string
#   - Reverse the string
#   - Divide the string into groups of 3
#     - Iterate through the string with index
#       - Initialize an empty array called `groups`
#       - if the current index is a multiple of 3 minus 1
#         - push the substrings from index position (current index -2) to current index to `groups`
#       - Else when reaching the final index position,
#         - push the last bit of substring to `groups` (if any)
#   - If there is only 1 group (i.e., less than 3 digits),
#     - keep it as it is
#   - Else,
#     - Join the string with a comma
#   - Reverse the string
# - Return the string

def division_stringified(num1, num2)
  reversed_digits = ((num2/num1) + 1).to_s.reverse
  groups = []
  reversed_digits.chars.each_with_index do |char, idx|
    if idx % (3 - 1) == 0
      groups <<
    end
end

p division_stringified(2, 3) #== "1"
# p division_stringified(5, 2) #== "3"
# p division_stringified(7, 3) #== "2"
# p division_stringified(6874, 67) == "103"
# p division_stringified(503394930, 43) == "11,706,859"
# p division_stringified(1, 10) == "0"
# p division_stringified(100000, 1) == "100,000"