# You are given a string containing 0's, 1's and one or more '?', where ? is a wildcard that can be 0 or 1.

# Return an array containing all the possibilities you can reach substituing the ? for a value.


# input: str, containing '1' '0' and/or '?'
# output: arr, containing all possibilities that can be reached substituting '?' for either '0' or '1'
# rules:
#     - '?' can be sub'd for either '1' or '0'
#     - for each '?' in input, expect 2 elements in output arr
# algorithm:
#     HIGH LEVEL:
#       -Iterate through
# ['??', '??', '??', '??']
# [0?, 0?, 1?, 1?]
# ["00", "01", "10", "11"]

# ?? => [0?, 1?] => ['11', '10', '00', '01'].sort

=begin
result = [0?, 1?]

??.each_char do |char|
  if char == ?
    result << (char) + "string"
    result << (char) + 'string'
end



=end

    # HIGH LEVEL:
    # - Iterate through str chars
    # - Where char is '1' or '0' leave as is
    # - Where char is '?' output with both '0' or '1'
    # LOW LEVEL:
    # - initialize result arr, empty arr
    # - init question_count variable to count of '?' in input str
    # - iterate through input str chars
    # - For question_count times
    #   - 2 times, append str with first '?' to 1 and 0
#     

def wildcard(str)
  result = []
  question_count = str.count('?')
  question_count.times do |i|
    2.times do |i2|
      result << str.sub('?', '1') if i2.even?
      result << str.sub('?', '0') if i2.odd?
    end
  end

  result.sort.map do |num|
    num.chars.map.with_index do |char, idx|
      if char == '?'
        idx.even? ? '1' : '0'
      else
        char
      end
    end.join
  end

end
  
  # question_count = str.count('?')
  # result = []
  # (question_count * 2).times {|i| result << str}
  # counter = (result.size * 2)
  # result.map do |int|
  #   counter_two = counter
  #   int.chars.map.with_index do |char, idx|
  #       if char == '1'
  #         '1'
  #       elsif char == '0'
  #         '0'
  #       elsif char == '?'
  #         counter -= 1
  #         counter.even? ? '1' : '0'
  #       end
  #     end.join
  # end
# end

# p wildcard('?') #== ['0', '1']
# p wildcard('101?') #== ["1010", "1011"]
p wildcard("??") #== ["00", "01", "10", "11"]
=begin
?? => [0?, 1?]
[0?, 1?] => [00, 01, 10, 11]

=end
# p wildcard("10??") == ["1000", "1001", "1010", "1011"]
# p wildcard("1?1?") == ["1010", "1011", "1110", "1111"]





=begin
In this kata, you will write a function that returns the positions and the values of the "peaks" (or local maxima) of a numeric array.

For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a value of 5 (since arr[3] equals 5). pos => [3] peak => [5]

The output will be returned as an object with two properties: pos and peaks. Both of these properties should be arrays. If there is no peak in the given array, then the output should be {pos: [], peaks: []}.

Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

All input arrays will be valid integer arrays (although it could still be empty), so you won't need to validate the input.
The first and last elements of the array will not be considered as peaks (in the context of a mathematical function, we don't know what is after and before and therefore, we don't know if it is a peak or not).
Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the position and value of the beginning of the plateau. For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in other languages)
Have fun!

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}

=end

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
    prior_index = arr.[idx-1]
    later_index = arr[idx+1]
    unless prior_index == nil || later_index == nil
      if arr[idx-1] < num && arr[idx+1] < num
        peaks << num
        pos << idx
      elsif
        (arr[idx+1]..arr[idx-1]).all? {|i| i <= num} && arr[idx-1] != num
        peaks << num
        pos << idx
      end
    end
  end
  
  result = Hash.new
  result["peaks"] = peaks
  result["pos"] = pos
  result
end


# p pick_peaks([1,2,3,6,4,1,2,3,2,1]) ==  {"pos"=>[3,7], "peaks"=>[6,3]}
# p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) #== {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
p pick_peaks([2,1,3,1,2,2,2,2,1]) #== {"pos"=>[2,4], "peaks"=>[3,2]}
# p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}