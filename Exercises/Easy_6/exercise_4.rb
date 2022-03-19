# Write a method that takes an Array as an argument, 
# and reverses its elements in place; that is, mutate 
# the Array passed into this method. The return value 
# should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# input: arr
# output: same arr, mutated to reverse elements
# explicit: 
#   - can't use reverse method
# algorithm
#   - initialize new arr to hold reversed elements
#   - iterate through input array
#     - add each element to the beginning of the new arr
#   - reassign each index of input array to reversed arr
#   - return input array

def reverse!(arr)
  reverse_arr = []
  arr.each { |element| reverse_arr.unshift(element) }
  arr.map! { |element| reverse_arr.shift }
end


  list = [1,2,3,4]
  result = reverse!(list)
  result == [4, 3, 2, 1] # true
  list == [4, 3, 2, 1] # true
  p list.object_id == result.object_id # true
  
  list = %w(a b e d c)
  reverse!(list) == ["c", "d", "e", "b", "a"] # true
  p list == ["c", "d", "e", "b", "a"] # true
  
  list = ['abc']
  reverse!(list) == ["abc"] # true
  p list == ["abc"] # true
  
  list = []
  reverse!(list) == [] # true
  p list == [] # true