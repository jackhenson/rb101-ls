# Write a method that takes an Array of numbers, 
# and returns an Array with the same number 
# of elements, and each element has the running 
# total from the original Array.

# input: array of numbers
# output: array of ints
# explicit:
#   - each int in output arr should be running total
#     - running total is sum of all elements at that index in input arr
#   - empty input arr returns empty array
# algorithm:
#   - initialize running total array
#   - iterate over input array array
#     - add each element to running total array
#     - sum running total array
#     - set sum to index in result array

def running_total(arr)
  running_total = []
  arr.map do |num|
    running_total << num
    running_total.sum
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []