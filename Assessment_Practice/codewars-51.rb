# Problem: Reverse or rotate?

# The input is a string str of digits. Cut the string into 
# chunks (a chunk here is a substring of the initial string) 
# of size sz (ignore the last chunk if its size is less than sz).

# If a chunk represents an integer such as the sum of the cubes 
# of its digits is divisible by 2, reverse that chunk; otherwise 
# rotate it to the left by one position. Put together these 
# modified chunks and return the result as a string.

# If
#     sz is <= 0 or if str is empty return ""
#     sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

# Example of a string rotated to the left by one position:
# s = "123456" gives "234561".

def revrot(str, n)
  return "" if n <= 0 || str.empty?
  chunks = []
  str_chars = str.chars
  str_chars.each do |char|
    chunk = str_chars.slice!(0, n)
    if chunk.size >= n
      chunk.map{|c| c.to_i.**3}.sum % 2 == 0 ? chunks << chunk.reverse : chunks << chunk.rotate
    end
  end
  chunks.join
end

# p revrot("1234", 0) == ""
# p revrot("", 0) == ""
# p revrot("1234", 5) == ""
# p revrot("733049910872815764", 5) == "330479108928157"
# p revrot("123456987654", 6) == "234561876549"
# p revrot("123456987653", 6) == "234561356789"
# p revrot("66443875", 4) == "44668753"
# p revrot("66443875", 8) == "64438756"
# p revrot("664438769", 8) == "67834466"
# p revrot("123456779", 8) == "23456771"
# p revrot("", 8) == ""
# p revrot("123456779", 0) == ""
# p revrot("563000655734469485", 4) == "0365065073456944"


# def revrot(str, sz)
#   return "" if sz <= 0 || sz > (str.size)
#   result = []
#   index = 0
#   until index >= str.size
#     chunk = str[index, sz]
#     if chunk.size >= sz
#       (chunk.to_i.digits.map{|i| i**3}.sum) % 2 == 0 ? result << chunk.reverse : result << chunk.concat(chunk.slice!(0))
#     end
#     index += sz
#   end
#   result.join
# end

# p revrot("1234", 0) == ""
# p revrot("", 0) == ""
# p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) #== "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"