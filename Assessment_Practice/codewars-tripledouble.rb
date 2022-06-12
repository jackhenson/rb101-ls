# Write a function triple_double(num1, num2) which takes numbers 
# num1 and num2 and returns 1 if there is a straight triple of number 
# at any place in num1 and also a straight double of the same number in num2.

# If this isn't the case, return 0

# p triple_double(451999277, 41177722899) == 1
# p triple_double(1222345, 12345) == 0
# p triple_double(12345, 12345) == 0
# p triple_double(666789, 12345667) == 1
# p triple_double(10560002, 100) == 1
# p triple_double(1112, 122) == 0

def triple_double(num1,num2)
  num1.to_s.chars.any? {|char| num2.to_s.include?(char*2) && num1.to_s.include?(char*3)} ? 1 : 0
end

# def triple_double(num1, num2)
#   num1 = num1.to_s
#   num2 = num2.to_s

#   num1.chars.each do |char|
#     if num1.include?(char*3)
#       return 1 if num2.include?(char*2)
#     end
#   end

#   0
# end

p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0