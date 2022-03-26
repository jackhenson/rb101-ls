# Write a method that computes the difference between 
# the square of the sum of the first n positive integers 
# and the sum of the squares of the first n positive integers.

# input: n, int rep first positive ints starting at 1
# output: int, difference bw square of sum of first n pos ints and
#               sum of squares of first n pos ints
# algorithm:
#         -SQUARE OF SUMS METHOD
#           - for nums in 1..num
#           - add nums and square this sum

#         -SUM OF SQUARES METHOD
#           - for nums in 1..num
#           - square each num
#           - add squares

#         -SUM SQUARE DIFFERENCE
#           -sq of sums minus sum of squars

def square_of_sums(n)
  sums = 0
  for num in 1..n
    sums += num
  end
  sums**2
end

def sum_of_squares(n)
  sum = 0
  for num in 1..n
    sum += (num**2)
  end
  sum
end

def sum_square_difference(n)
  square_of_sums(n) - sum_of_squares(n)
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150