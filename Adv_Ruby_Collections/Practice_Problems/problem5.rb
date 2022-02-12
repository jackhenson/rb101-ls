# figure out the total age of just the male members of the family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_male_age = 0

munsters.each_value do | details |
  total_male_age += details['age'] if details['gender'] == 'male'
end

p total_male_age

# total_male_age = munsters.values.reduce(0) do | memo, hsh |
#   if hsh['gender'] == 'male'
#     memo + hsh['age']
#   else memo
#   end
# end
# p total_male_age # => 444