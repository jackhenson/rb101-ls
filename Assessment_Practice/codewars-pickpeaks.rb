# In this kata, you will write a function that returns
# the positions and the values of the "peaks" (or 
# local maxima) of a numeric array.

# For example, the array arr = [0, 1, 2, 5, 1, 0] has 
# a peak at position 3 with a value of 5 (since arr[3] equals 5). 
# pos => [3] peak => [5]

# The output will be returned as an object with 
# two properties: pos and peaks. 
# Both of these properties should be arrays. 
# If there is no peak in the given array, then the output 
# should be {pos: [], peaks: []}.

# Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) 
# should return {pos: [3, 7], peaks: [6, 3]} 

# All input arrays will be valid integer arrays 
# (although it could still be empty), so you won't 
# need to validate the input.

# The first and last elements of the array will not 
# be considered as peaks (in the context of a mathematical function, 
# we don't know what is after and before and therefore, we don't know 
# if it is a peak or not).

# Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak 
# while [1, 2, 2, 2, 3] and [1, 2, 2, 2, 2] do not. 

# In case of a plateau-peak, please only return the position and 
# value of the beginning of the plateau. 

# For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} 


# input: arr
# output: hash, with two entries: "pos"
# algo:
#   - init peaks arr
#   - init pos arr
#   - iterate through input arr with index
#     - if num at index -1 && index + 1 are less than num
#       - append num to peaks arr
#       - append idx to pos arr
#     - elsif all nums at later index are equal to or less than
#     - AND previous index is not equal  to num
#       - append num to peaks arr
#       - append idx to pos arr
#   - initialize result hash
#   - add peaks and pos arrs to result hash

def pick_peaks(arr)
  peaks = []
  pos = []
  arr.each_with_index do |num, idx|
    prior_index = idx - 1
    later_index = idx + 1
    unless prior_index == -1 || later_index == (arr.size)
      if arr[prior_index] < num && arr[later_index] < num
        peaks << num
        pos << idx
      elsif
        (arr[(idx+1)..-1]).all? {|i| i <= num} && arr[idx-1] < num && (arr[(idx+1)..-1]).any? {|i| i < num}
        peaks << num
        pos << idx
      end
    end
  end
  
  { "pos" => pos, "peaks" => peaks }
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}