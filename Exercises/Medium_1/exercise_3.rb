# If you take a number like 735291, and rotate it 
# to the left, you get 352917. If you now keep the 
# first digit fixed in place, and rotate the 
# remaining digits, you get 329175. Keep the 
# first 2 digits fixed in place and rotate again 
# to 321759. Keep the first 3 digits fixed in place 
# and rotate again to get 321597. Finally, keep the 
# first 4 digits fixed in place and rotate the final 
# 2 digits to get 321579. The resulting number is 
# called the maximum rotation of the original number.

# Write a method that takes an integer as argument, 
# and returns the maximum rotation of that argument. 
# You can (and probably should) use the 
# rotate_rightmost_digits method from the 
# previous exercise.

# Note that you do not have to handle multiple 0s.

# input: int
# output: int, with maximum rotation
# algorithm:
#       - initialize result variable, assigned to int value num
#       - initialize counter, assigned to int str size
#       - loop, rotating rightmost digits with counter
#         - break if counter > 2
#       - return result int

def max_rotation(num)
  result = num
  counter = num.to_s.size
  loop do
    break if counter < 2
    result = rotate_rightmost_digits(result, counter)
    counter -= 1
  end

  result
end

def rotate_array(arr)
  new_arr = arr.clone
  new_arr.push(new_arr.shift)
end

def rotate_rightmost_digits(num, n)
  str_chars = num.to_s.chars
  chars_to_rotate = str_chars.slice!(-n..-1)
  result = str_chars + rotate_array(chars_to_rotate)
  result.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
