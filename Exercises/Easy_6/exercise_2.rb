# Write a method that takes an array of strings, 
# and returns an array of the same string values, 
# except with the vowels (a, e, i, o, u) removed.

# input: array of strings
# output: arr of modified str, vowels removed
# explicit: return same string objects
# algorithm:
#   - iterate through each string
#   - transform each string, delete each vowel
#   - return modified array

def remove_vowels(arr)
  arr.map! { |string| string.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
