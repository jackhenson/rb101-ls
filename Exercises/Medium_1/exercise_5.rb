# Write a method that displays a 4-pointed diamond 
# in an n x n grid, where n is an odd integer that 
# is supplied as an argument to the method. You may 
# assume that the argument will always be an odd integer.

# input: n, odd int
# output: row of strs, n wide showing diamond
# algorithm:
#       - initialize empty arr, star nums
#       - for range of 1 to n, add to arr if odd
#       - for range of n-1 to 1, add to arr if odd
#       - iterate over each nums in arr
#         - print num stars, centered n spaces

def diamond(n)
  star_nums = []
  (1..n).each {|num| star_nums << num if num.odd?}
  (n-1).downto(1) {|num| star_nums << num if num.odd?}
  star_nums.each {|num| puts ('*'*num).center(n)}
end

p diamond(9)
p diamond(3)
