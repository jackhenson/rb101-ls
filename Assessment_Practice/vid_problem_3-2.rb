# Write a method to find the longest common prefix
# string amongst an array of strings

# If there is no common prefix, return an empty string ""

# input: arr of string
# output: str, longest common prefex
# algo:
#     - initialize result variable to empty str
#     - iterate through chars of first str in input arr
#       - if that char is at that index in each str, append char to result str
#         - else, return str
#     

def common_prefix(arr)
  result = ''
  arr[0].chars.each_with_index do |char, idx|
    if arr.all? {|word| word[idx] == char}
      result << char
    else
      return result
    end
  end
  result
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"