# Write a method that takes a string, and 
# returns a new string in which 
# every character is doubled.

# input: string
# output: new string, every char doubled
# algorithm:
#     - Initialize new result arr
#     - Iterate over each char in input str
#       - Add each char twice to result arr
#     - Join and return result arr as str

def repeater(str)
  result = str.chars.map {|char| char*2}.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
