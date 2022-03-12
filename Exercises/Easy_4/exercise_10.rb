# In the previous exercise, you developed a method that 
# converts non-negative numbers to strings. In this exercise,
# you're going to extend that method by adding the ability 
# to represent negative numbers as well.

# Write a method that takes an integer, and converts it to 
# a string representation.

# You may not use any of the standard conversion methods 
# available in Ruby, such as Integer#to_s, String(), 
# Kernel#format, etc. You may, however, use 
# integer_to_string from the previous exercise.

DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}
  
def signed_integer_to_string(integer)
  num = integer.abs
  string_num = ''
  loop do
    last_num = num % 10
    string_num << DIGITS[last_num]
    num = num / 10
    break if num == 0
  end

  string_num.reverse!
  sign = (integer * -1).positive? ? '-' : '+'
  integer == 0 ? string_num : string_num.prepend(sign)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'