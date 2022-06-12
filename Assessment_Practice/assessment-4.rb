# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

def closest_numbers(arr)
  pairs = []
  arr.each do |num|
    idx = 0
    until idx >= arr.size
      pairs << [num, arr[idx]] unless arr[idx] == num
      idx += 1
    end
  end
  pairs.min_by {|pair| pair.inject(:-).abs}
end

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) #== [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".