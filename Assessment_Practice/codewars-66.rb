# You will be given two integers n and k and 
# your task is to remove k-digits from n and 
# return the lowest number possible, without 
# changing the order of the digits in n. 
# Return the result as a string.

# Let's take an example of solve(123056,4). We need to 
# remove 4 digits from 123056 and return the lowest 
# possible number. The best digits to remove are (1,2,3,6) 
# so that the remaining digits are '05'. 
# Therefore, solve(123056,4) = '05'.

# Note also that the order of the numbers in n does 
# not change: solve(1284569,2) = '12456', because 
# we have removed 8 and 9. 

def solve(n,k)
  result_size = (n.size - k)
  possible_nums = []
  num_chars = n.to_s.chars
  (0..(n.size-k)).each do |idx|
     num = num_chars - (num_chars[idx...(idx+(k))])
     if num.size == result_size
      possible_nums << num.join
     end
  end
  p possible_nums
  # .min_by {|n| n.to_i}
end

# input: 2 ints, n and k (amt of digits to remove)
# output: str, representing lowest num possible after removing k digits
# algo:
#     - HIGH LEVEL:
#       - Find all possible numbers, with k digits removed
#       - Return lowest num as str
#     - LOW LEVEL:
#       - initialize current_num to n
#       - initialize result empty arr
#       - initialize counter to k
#       - Until counter <= 0 
#         - Loop over each digit
#           - Remove current digit, append to result arr
#      - Reassign current_num to min value in result arr
#      - Reassign result arr to empty arr
#     - Reassign counter to counter - 1
#      - Loop over min value
#       - Remove digit at index, append to

# def solve(n, k)
#   current_num = n
#   result = []
#   counter = k
  
#   until counter <= 0
#     current_num.to_s.chars.each do |c|
#       result << current_num.to_s.sub(c, '')
#     end
#     current_num = result.min
#     result = []
#     counter -=1
#   end

#   current_num
# end

# p solve(123056,2) == '1056'
# p solve(123056,3) == '056'
# p solve(123056,4) == '05'
# p solve(1284569,1) == '124569'
# p solve(1284569,2) == '12456'
# p solve(1284569,3) == '1245'
# p solve(1284569,4) == '124'


p solve(123056,2) #== '1056'
# p solve(123056,3) == '056'
# p solve(123056,4) == '05'
# p solve(1284569,1) == '124569'
# p solve(1284569,2) == '12456'
# p solve(1284569,3) == '1245'
# p solve(1284569,4) == '124'