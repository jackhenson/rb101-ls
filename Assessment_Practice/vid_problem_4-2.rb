# Write function scramble(str1, str2) that
# returns true if a portion of str 1 characters
# can be rearranged to match str2, otherwise
# return false.

# Only lowercase letters used, no puntuation or digits.

# input: 2 str
# output: boolean, if portion of str1 can be rearranged to str2
# algo:
#     - sort both strings, initialized to new variables
#     - iterate through chars of 

def scramble(str1, str2)
  # str1_sorted = str1.chars.sort.join 
  # str2_sorted = str2.chars.sort.join
  str2.chars.each do |char|
    if str1.count(char) >= str2.count(char)
      next
    else
      return false
    end
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('codewaraaossoqqyt', 'codewars') == true
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true