# Write a method that counts the number of occurrences 
# of each element in a given array.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]

# count_occurrences(vehicles)

# The words in the array are case-sensitive: 'suv' != 'SUV'. 
# Once counted, print each element alongside the number 
# of occurrences.

# Expected output:

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# input: arr of strings
# output: hash element
# algorithm
#   - initialize a new hash
#   - count each instance of string in the input array
#   - add once instance of each string to new hash
#   - add number of occurrences as value to each hash key
#   - print each hash element

def count_occurrences(arr)
  new_hash = arr.each_with_object({}) do |str, hsh|
    unless hsh.include?(str)
      hsh[str] = arr.count(str)
    end
  end

  new_hash.each {|key, value| puts "#{key} => #{value}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)