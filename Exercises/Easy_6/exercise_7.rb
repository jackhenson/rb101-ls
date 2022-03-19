# Write a method that takes an Array as an argument, 
# and returns two Arrays (as a pair of nested Arrays) 
# that contain the first half and second half of the 
# original Array, respectively. If the original array 
# contains an odd number of elements, the middle element 
# should be placed in the first half Array.

# input: array
# output: 2 arrays, each contain half of input arr
# explicit:
#   - number of elements in input arr even or odd?
#     - if odd number, middle element in first half arr
# algorithm:
#   - initialize second half arr
#   - for input arr size / 2 times
#     - remove last element of input arr, append to front of second half arr
#   - return both arr

def halvsies(arr)
  second_half = []
  (arr.size/2).times { |i| second_half.unshift(arr.pop) }
  [arr, second_half]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]