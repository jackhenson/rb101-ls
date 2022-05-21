# The maximum sum subarray problem consists of
# finding the maximum sum of a contiguous subsequence
# in an array of integers
#
# max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])
# should be 6: [4, -1, 2, 1]

# Easy case is when the array is made up of only
# positive numbers and the max sum is the sum of the
# whole array. If the array is made up of only
# negative numbers, return 0 instead.

# Empty array is considered to have zero greatest sum.
# Note than an empty array is also a valid subarray.

# input: arr
# output: int, max sum of subseq
# algo:
#     - initialize subseq empty arr
#     - sum each subseq
#     - return max sum

def max_sequence(arr)
  return 0 if arr.all? {|num| num < 0}
  subseq = []
  idx = 0
  loop do
    break if idx >= arr.size
    n = arr.size - idx
    until n == 0
      subseq << arr[idx, n]
      n -= 1
    end
    idx += 1
  end
  subseq.map(&:sum).max#> 0 ? subseq.map(&:sum).max : 0
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12