# Write a method that takes an Array of numbers 
# and then returns the sum of the sums of each 
# leading subsequence for that Array. You may 
# assume that the Array always contains 
# at least one number.

# input: arr
# output: int, sum of sums of each leading subseq

# algorithm:
#     - initialize new result variable set to value at index 0 of input arr
#     - starting at index 1, for size of input arr
#       - add sum of nums from idx 0 to current idx
#       - add sum to result
#     - return result

#FIRST ATTEMPT
def sum_of_sums(arr)
  result = 0
  idx = 1
  loop do
    result += arr.slice(0, idx).sum
    idx += 1
    break if idx > arr.size
  end
  result
end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35