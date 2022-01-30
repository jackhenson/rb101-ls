flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

new_hash = flintstones.each_with_object({}) do | name, hash |
  hash[name] = flintstones.index(name)
end

p new_hash