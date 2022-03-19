# Write a method that takes a positive 
# integer, n, as an argument, and displays 
# a right triangle whose sides each have n stars. 
# The hypotenuse of the triangle (the diagonal 
# side in the images below) should have one 
# end at the lower-left of the triangle, and 
# the other end at the upper-right.

# algorithm:
#   - initialize variable for stars string
#   - loop n times
#     - output stars string, justified to right
#     - add start to stars string

# def triangle(n)
#   stars = '*'
#   n.times do |i| 
#     puts stars.rjust(n)
#     stars += '*'
#   end
# end

# Try modifying your solution so it prints the triangle upside 
# down from its current orientation. Try modifying your solution 
# again so that you can display the triangle with the right 
# angle at any corner of the grid.

def triangle(n)
  stars = '*' * n
  n.times do |i| 
    puts stars.rjust(n)
    stars.chop!
  end
end


p triangle(5)
p triangle(9)