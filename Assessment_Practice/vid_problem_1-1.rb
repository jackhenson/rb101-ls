# Given a non-empty string, check if it can be constructed
# by taking a substring of it and appending multiple
# copies of the substring together. You may assume the
# given string consists of lowercase letters only.

# input: str
# output: boolean, if input str can be constructed from multi substr
# algo:
#     - initialize substr, empty arr
#     - find all substrings of input str that begin at index 0
#       - iterate over input str chars
#       - initialize substr_length variable to 1
#       - append substr of input str, from idx with length of substr_length
#       - increase substr_length by 1
#     - if any substr can be multiplied to get input str, return true

def repeated_substring_pattern(str)
  substr = []
  (1...str.size).each do |num|
    substr << str[0, num]
  end
  substr.any? {|ss| ss * (str.size/ss.size) == str}
end

p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aba') == false
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true
p repeated_substring_pattern('abcabcabc') == true