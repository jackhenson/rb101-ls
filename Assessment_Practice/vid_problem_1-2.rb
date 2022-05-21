# Given an array of strings made only from lowercase letters,
# return an array of all characters that show up in all
# strings within the given array (including duplicates).
# For example, if a character appears 3 times in all strings
# but not 4 times, include that character 3 times in final answer.

# input: arr of strings
# output: arr of strings, that appear in all string within input arr
# algorithm:
#     - initialize empty result arr
#     - initialize variable test_str to str with uniq chars from first input str
#     - iterate through characters of test_str
#       - if each input str includes that char,
#         append char to result arr times the count of char in each input str
#     - return result arr

def common_chars(arr)
  arr.map {|str| str.dup}
  result = []

  first_str_chars = arr.first.chars
  first_str_chars.each do |char|
    if arr.all? {|str| str.include? char}
      result << char
      arr.each {|str| str.sub! char, ''}
    end
  end
  result
end

p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaa', 'ccdddddd', 'eeffee', 'ggrrrrr', 'yyyzzz']) == []