# Write a method that takes two Array arguments 
# in which each Array contains a list of numbers, 
# and returns a new Array that contains the product 
# of every pair of numbers that can be formed between 
# the elements of the two Arrays. The results should 
# be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# input: two arr, containing numbers
# output: new arr with all possible products bw input arrs, sorted in increasing value
# explicit: no empty input arrs
# algorithm:
#     - initialize new empty result arr
#     - iterate through first input arr
#       - for each element
#         - multiply with each num in input arr 2
#         - append each product to result arr

def multiply_all_pairs(arr1, arr2)
  result = Array.new
  arr1.each do |num|
    arr2.each do |num2|
      result << num * num2
    end
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]