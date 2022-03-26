# A collection of spelling blocks has two letters 
# per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the 
# blocks to just those words that do not use both
# letters from any given block. Each block 
# can only be used once.

# Write a method that returns true if the word 
# passed in as an argument can be spelled from 
# this set of blocks, false otherwise.

# input: str
# output: boolean
# algorithm:
#     - initialize variable assigned to blocks arr
#     - initialize variable assigned to str chars arr
#     - iterate over blocks arr
#       - if str chars arr includes both subarr chars, return false
#     - return true


BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
          ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(str)
  str_chars = str.upcase.chars
  BLOCKS.each do |block|
    if str_chars.include?(block[0]) && str_chars.include?(block[1])
      return false
    end
  end

  true
end

# Given solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
