ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?('Spot')
p ages.fetch('Spot', "Spot's not here!")
p ages.any?('Spot')