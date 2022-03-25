# Write a method that rotates an array by moving 
# the first element to the end of the array. 
# The original array should not be modified.

# Do not use the method Array#rotate 
# or Array#rotate! for your implementation.

# input: arr
# output: arr, rotated

def rotate_array(arr)
  new_arr = arr.clone
  new_arr.push(new_arr.shift)
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true