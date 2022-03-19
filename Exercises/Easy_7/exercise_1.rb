# Write a method that combines two Arrays passed in as arguments, 
# and returns a new Array that contains all elements from both 
# Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that 
# they have the same number of elements.

# input: two arrays
# output: new array, including all elements in alternating order
# algorithm:
#   - initalize result arr
#   - add first element of first input array to result array
#   - add first element of second input array to result array
#   - repeat for all elements
#   - return result arr

def interleave(arr1, arr2)
  result = []
  idx = 0
  loop do
    result << arr1[idx]
    result << arr2[idx]
    idx += 1
    break if idx == arr1.size
  end

  result
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']