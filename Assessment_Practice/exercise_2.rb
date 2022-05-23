# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:



# The tests above should print "true".

# input: arr of int
# output: int, minimum sum of 5 consecutive numbers
# algorithm:
#       - if input arr size < 5, return nil
#       - initialize subseq empty arr
#       - iterate through input arr, with index
#         - append subseq from idx to length of 5, if subseq length is 5
#       - transform subseq arr, find sum of each inner arr
#       - return min value

def minimum_sum(arr)
  return nil if arr.size < 5
  subseq = []
  arr.each_with_index do |num, idx|
    ss = arr[idx, 5]
    subseq << ss if ss.size == 5
  end
  subseq.map(&:sum).min
end


p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10