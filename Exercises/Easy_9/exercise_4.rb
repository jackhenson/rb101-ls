# Write a method that takes an integer argument, 
# and returns an Array of all integers, in sequence, 
# between 1 and the argument.

# You may assume that the argument will always be a 
# valid integer that is greater than 0.

# input: int
# output: arr, contains all ints bw 1 and input int
# algorithm:
#     - initialize new result arr
#     - iterate through range of 1..input
#       - append each num to result arr

def sequence(int)
  result = []
  for num in 1..int
    result << num
  end
  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
