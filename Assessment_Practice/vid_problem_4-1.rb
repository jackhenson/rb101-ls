# Given 2 strings, find out if there is a substring
# that appears in both strings. You will return true
# if you find a substring that appears in both strings,
# or false if you do not. We only care about substrings
# that are longer than one letter long.

# input: 2 string
# output: boolean, true if substr in both input str
# algorithm:
#       - if either input str is empty, return false
#       - initialize 2 substr variables to empty arrays
#       - add all substr of each input str to empty arrays
#       - find if the substr arrs intersect, return this

def substring_test(str1, str2)
  return false if str1.empty? || str2.empty?
  substr1 = []
  str1.chars.each_with_index do |_, idx|
    substr_length = 2
    until substr_length > (str1.size - idx)
      substr1 << str1[idx, substr_length]
      substr_length += 1
    end
  end
  substr1.any? {|substr| str2.downcase.include? substr.downcase}
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true