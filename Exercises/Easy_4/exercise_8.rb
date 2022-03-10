# In the previous exercise, you developed a method
#  that converts simple numeric strings to Integers. 
#  In this exercise, you're going to extend that method 
#  to work with signed numbers.

# # Write a method that takes a String of digits, and 
# returns the appropriate number as an integer. The 
# String may have a leading + or - sign; if the first 
# character is a +, your method should return a positive 
# number; if it is a -, your method should return a 
# negative number. If no sign is given, you should 
# return a positive number.

# # You may assume the string will always contain a 
# valid number.

# # You may not use any of the standard conversion 
# methods available in Ruby, such as String#to_i, 
# Integer(), etc. You may, however, use the 
# string_to_integer method from the previous lesson.

# input: string of digits
# output: integer
# explicit:
#   - if has leading + return positive number
#   - if has leading - return negative number
#   - if no leading sign, return positive number
#   - no conversion methods allowed (ie String#to_i)
# algorithm:
#   - conditional, if string has leading sign
#     - remove leading sign
#     - convert string to int
#       - if - leading sign, make int negative

#FIRST ATTEMPT
# def string_to_signed_integer(str)
#   first_value = str[0].to_i
#   if (1..9).include?(first_value)
#     string_to_integer(str)
#   else
#     sign = str.slice!(0)
#     if sign == '+'
#       string_to_integer(str)
#     else
#       string_to_integer(str) * -1
#     end
#   end
# end


# SECOND ATTEMPT
# def string_to_signed_integer(string)
#   str_after_sign = string[1..-1]
#   converted_str = 
#   case string[0]
#   when '-' then -string_to_integer(str_after_sign)
#   when '+' then string_to_integer(str_after_sign)
#   else          string_to_integer(string)
#   end
# end

# REFACTORED
def string_to_signed_integer(string)
  sign = string.start_with?('-') ? -1 : 1
  number = string.start_with?('-', '+') ? string[1..-1] : string

  string_to_integer(number) * sign
end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}
  
def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each do |digit| 
    value = 10 * value + digit
  end

  value
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100