# Write a method that takes a string with one or 
# more space separated words and returns a hash 
# that shows the number of words of different sizes.

# Words consist of any string of characters that 
# do not include a space.

# input: string
# output: hash, keys are word length, values are total words of that length
# algorithm:
#   - Initialize new hash, with starting values of 0
#   - Separate words into an array
#   - Iterate over the array
#     - Add each word length as key, add 1 to value
#   - Return the hash

def word_sizes(string)
  word_hash = Hash.new(0)
  string.split.each do |word|
    word_hash[word.length] += 1
  end

  word_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}