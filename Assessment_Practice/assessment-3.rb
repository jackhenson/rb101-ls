# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# input: str
# output: str, every 2nd char in every 3rd word upcase
# algo:
#   - Iterate through arr of words in input str with index1
#     - Iterate through chars in each word with index2
#       - If word index1+1 is divisible by 3
#         - Upcase every char where index2+1 is divisible by 2
#       - Else leave as is
#  - Join and return str

def to_weird_case(str)
  str.split.map.with_index do |word, idx1|
    word.chars.map.with_index do |char, idx2|
      if (idx1 + 1) % 3 == 0
        (idx2 + 1) % 2 == 0 ? char.upcase : char
      else
        char
      end
    end.join
  end.join(' ')
end

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