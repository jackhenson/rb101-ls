# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# input: str
# output: str, every 2nd character in every 3rd word is uppercase
# algorithm:
#       - split the words into an array
#       - iterate through arr with index
#         - if index+1 div by 3
#           - iterate through that word with index
#             - if letter's index+1 is divisable by 2, upcase it
#       - return str

# SECOND ATTEMPT
def to_weird_case(str)
  str.split.map.with_index do |word, idx|
    if (idx+1) % 3 == 0
      word.chars.map.with_index do |char, idx|
        if (idx+1) % 2 == 0
          char.upcase
        else
          char
        end
      end.join
    else
      word
    end
  end.join(' ')
end

# FIRST ATTEMPT
# def to_weird_case(str)
#   words = str.split(' ')
#   result = []
#   counter = 0
#   loop do
#     if (counter + 1) % 3 == 0
#       result << words[counter].chars.map.with_index {|char, idx| (idx+1) % 2 == 0 ? char.upcase : char}.join
#     else
#       result << words[counter]
#     end
#     counter += 1
#     break if counter >= words.size
#   end
#   result.join(' ')
# end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".