# Write a method that rotates an array by moving the 
# first element to the end of the array. The original 
# array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Example:

# input: arr of int
# output: arr of ints, rotated so first element moved to end of arr
# rules: 
#     - do not mutate input arr
# algo:
#     - slice (non-mutating) from index 1 to -1 of input arr
#     - concatenate first element of input arr

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
