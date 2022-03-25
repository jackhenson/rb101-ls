# Write a method that can rotate the 
# last n digits of a number

# Note that rotating just 1 digit results 
# in the original number being returned.

# You may use the rotate_array method from 
# the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

# input: arr
# output: arr, last n digits rotated
# algorithm:
#     - convert input1 int to str chars
#     - remove last n chars
#     - rotate arr of removed chars
#     - append rotated chars to original str char arr
#     - join arr and convert to int

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

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917