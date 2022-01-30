statement = "The Flintstones Rock"

statement_chars = statement.delete(' ').chars.uniq!.sort

new_hash = statement_chars.each_with_object({}) do | char, hash |
  hash[char] = statement.count(char)
end

p new_hash