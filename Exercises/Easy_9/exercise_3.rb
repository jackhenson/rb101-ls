# Write a method that takes a number as an argument. 
# If the argument is a positive number, return the 
# negative of that number. If the number 
# is 0 or negative, return the original number.

# input: int
# output: int
# explicit:
#       - if num is positive, return neg of that num
#       - if num is 0 or neg, return orginal num

def negative(int)
  int.positive? ? -int : int
end


p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby