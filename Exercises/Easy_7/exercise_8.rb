# Write a method that takes two Array arguments 
# in which each Array contains a list of numbers, 
# and returns a new Array that contains the product 
# of each pair of numbers from the arguments that 
# have the same index. You may assume that the 
# arguments contain the same number of elements.

# input: two arrays
# output: new arr, containing product of each pair with same index
# explicit: each input arr contains same # of elements
# algorithm:
#     - Initialize new result arr
#     - Iterate through first input arr
#       - Multiply each element with element at that idx in input arr 2
#       - Append product to result arr
#     - Return result arr

# def multiply_list(arr1, arr2)
#   result = []
#   arr1.each_with_index { |num, idx| result << num * arr2[idx] }
#   result
# end

# with Array#zip
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |subarr| subarr.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]