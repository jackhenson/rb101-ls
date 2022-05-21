# Create a method that takes a positive integer
# and returns the next biggest number formed
# by the same digits

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using these digits,
# return -1

# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

# input: int
# output: int, next bigger number
# algorithm:
#       - find max possible num using input digits, initialize to max variable
#       - iterate over range of input + 1..max
#         - if num includes same digits as input, return num
#       - return -1

def next_bigger_number(int)
  max_num = int.to_s.chars.sort.reverse.join.to_i
  (int+1..max_num).each do |num|
    return num if int.to_s.chars.sort == num.to_s.chars.sort
  end
  -1
end  

p next_bigger_number(9) == -1
p next_bigger_number(12) == 21
p next_bigger_number(513) == 531
p next_bigger_number(2017) == 2071
p next_bigger_number(2071) == 2107
p next_bigger_number(111) == -1
p next_bigger_number(531) == -1
p next_bigger_number(123456789) == 123456798