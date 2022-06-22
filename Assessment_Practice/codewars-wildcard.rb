# You are given a string containing 0's, 1's and 
# one or more '?', where ? is a wildcard that can be 0 or 1.

# Return an array containing all the possibilities you 
# can reach substituing the ? for a value.

# '101?' -> ['1010', '1011']

# '1?1?' -> ['1010', '1110', '1011', '1111']

# Notes:
#     Don't worry about sorting the output.
#     Your string will never be empty.

# input: str
# output: arr of strs, all possibilities for ? subs
# algo:
# - init result arr
# - init question_counter to count of '?' in str * 2
# - iterate over chars with index
#   - if char is '?'
#     - append str with '?' sub'd for '0'
#     - append str with '?' sub'd for '1'
# - transform result arr
#    - transform chars
#      - if char is '?'
#       - sub for '0' if question_counter is even, '1' if odd

# def wildcard(str)
#   result = []
#   question_count = (str.count('?') * 2)
#   counter = 0
#   question_count.times do |i|
#     result << str.sub('?', counter.to_s)
#     counter > 0 ? counter -= 1 : counter += 1
#   end
#   result.sort.each do |num|
#     counter.even? ? num.sub!('?', '0') : num.sub!('?', '1')
#     counter += 1
#   end
#   result.sort
# end

def wildcard(str)
  result = Array.new
 
 # Separate the string into an array
 str.chars.each.with_index do |char, index|
   if char == '?'
     result << str[0...index] + "0" + str[index + 1..-1]
     result << str[0...index] + "1" + str[index + 1..-1]
   end
 end

 p result
 
#  Iterate through the array
#  Use a loop..do incase theres more than 2+ '?'
#  until result.map{|i| i.count('?')}.sum <= 0
#   counter = 1
#     result.map! do |string|
#       if string.include?('?')
#         counter > 2 ? counter -= 2 : counter += 1
#         string.sub('?', counter.to_s)
#       else
#         string
#       end
#     end
#  end
 
#  result.sort
# end

# p wildcard('?') == ['0', '1']
# p wildcard('101?') == ["1010", "1011"]
# p wildcard("??") == ["00", "01", "10", "11"]
p wildcard("10??") #== ["1000", "1001", "1010", "1011"]
# p wildcard("1?1?") == ["1010", "1011", "1110", "1111"]