# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# input: arr of ints
# output: int, min sum of 5 cons nums in arr
# rules:
#       - return nil if fewer than 5 elements
# algo:
#   HIGH LEVEL
#     - Create subarrs of all cons 5 ints
#     - Return min sum
#   LOW LEVEL
#     - If input arr size less than 5, return nil
#     - Init subarr variable to empty arr
#     - Iterate through input arr nums with index
#       - Unless index is greater than size of input arr - 5
#         - Append slice of input arr, index with length of 5, to subarrs arr
#     - Sum each arr, return min sum

def minimum_sum(arr)
  return nil if arr.size < 5
  subarr = []
  arr.each_with_index do |num, idx|
    unless idx > (arr.size - 5)
      subarr << arr[idx, 5]
    end
  end
  subarr.map(&:sum).min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".