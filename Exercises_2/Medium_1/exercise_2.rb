# Write a method that can rotate the 
# last n digits of a number. For example:

# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

# Note that rotating just 1 digit results in 
# the original number being returned.

# You may use the rotate_array method from the 
# previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

def rotate_rightmost_digits(num, n)
  num_arr = num.to_s.split('').map(&:to_i)
  digits_to_rotate = num_arr.slice!(-n, n)
  (num_arr + rotate_array(digits_to_rotate)).join.to_i
end

def rotate_array(arr)
  result = []
  arr.each_with_index {|element, idx| result << element if idx > 0}
  result << arr.first
  result
end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917