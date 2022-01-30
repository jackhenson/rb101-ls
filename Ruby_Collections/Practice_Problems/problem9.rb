def titleize(string)
  string_words = string.split(' ')
  new_string = ''

  string_words.each do |word|
    new_string << word.capitalize + ' '
  end

  new_string.strip!
end

words = "The Flintstones Rock"
p titleize(words)