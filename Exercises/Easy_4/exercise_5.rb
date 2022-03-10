# Write a method that searches for all multiples 
# of 3 or 5 that lie between 1 and some other number, 
# and then computes the sum of those multiples. For 
# instance, if the supplied number is 20, the result 
# should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an 
# integer greater than 1.

# input: integer
# output: integer
# explicit:
#   - output int is sum of all multiple of 3 & 5 between 1 and number
#   - input is greater than 1
# algorithm:
#   - initialize multiples array
#   - iterate through range of 1..num
#   - on each iteration, if num is multiple
#     - append to the multiples array
#   - sum multiples array

def multisum(int)
  multiples = []
  for i in 1..int
    if i % 3 == 0 || i % 5 == 0
      multiples << i
    end
  end

  multiples.inject(&:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168