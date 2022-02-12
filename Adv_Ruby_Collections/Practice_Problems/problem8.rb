# Using the each method, output all of the vowels from the strings

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = ['a', 'e', 'i', 'o', 'u']
string_vowels = []

hsh.values.flatten.each do | str |
  str.chars.each do | char |
    if vowels.include?(char)
      string_vowels << char
    end
  end
end

p string_vowels
