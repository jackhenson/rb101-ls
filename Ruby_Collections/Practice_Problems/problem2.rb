ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# def find_total_of_ages(ages)
#   total_of_ages = 0
#   count = 0
#   ages_keys = ages.keys

#     loop do
#       break if count == ages_keys.length
#       total_of_ages += ages[ages_keys[count]]
#       count += 1
#     end

#   total_of_ages
# end

# p find_total_of_ages(ages) # => 6174

total_of_ages = 0

total = ages.each do | _, value |
  total_of_ages += value
end

p total_of_ages # => 6174