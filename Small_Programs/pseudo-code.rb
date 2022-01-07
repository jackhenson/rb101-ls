# # a method that returns the sum of two integers 
# #higher-level algorithm: add two numbers

# START

# Given two integers, integer1 and integer2

# SET result = integer1 plus integer2

# PRINT result


# # a method that takes an array of strings, and returns a string that is all those strings concatenated together 
# #higher-level algorithm: concatenate all strings from the given array

# START

# Given an array of strings, arr

# SET new_string = value at first position of arr

# def concatenate_string(arr)
#   arr.join

new_string = ""
arr = ["hey", "there", "dude"]
# puts arr.join(" ")
arr.each do |string|
  new_string += string
end
puts new_string 

