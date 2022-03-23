# Given an array, write a program that prints out 
# groups of words that are anagrams. Anagrams are 
# words that have the same exact letters in them 
# but in a different order. 

# input: arr
# output: print arrs of anagrams
# algorithm:
#       - select words from arr
#         - words where all sorted chars are equal

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

def anagrams(arr)
  p arr.select {|word| word.chars.sort == word.chars.sort }.group_by {|word| word.chars.sort }.values
end

# Given solution
# def anagrams(words)
#   result = {}

#   words.each do |word|
#     key = word.split('').sort.join
#     if result.has_key?(key)
#       result[key].push(word)
#     else
#       result[key] = [word]
#     end
#   end

#   result.each_value do |v|
#     puts "------"
#     p v
#   end
# end

anagrams(words)



# Your output should look something like this:
["demo", "dome", "mode"]
["neon", "none"]
#(etc)