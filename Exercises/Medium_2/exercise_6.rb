# A triangle is classified as follows:

#     right One angle of the triangle is a right angle (90 degrees)
#     acute All 3 angles of the triangle are less than 90 degrees
#     obtuse One angle is greater than 90 degrees.

# To be a valid triangle, the sum of the angles must be 
# exactly 180 degrees, and all angles must be greater 
# than 0: if either of these conditions is not satisfied, 
# the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as 
# arguments, and returns a symbol :right, :acute, :obtuse, or :invalid 
# depending on whether the triangle is 
# a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to 
# worry about floating point errors. You may also assume 
# that the arguments are specified in degrees.

# input: 3 int, angles of triangle
# output: symbol, rep type of triangle
# algorithm:
#       - VALID TRIANGLE METHOD
#         - if sum of all angles equal 180
#         - all angles greater than zero

#       - initialize arr containing side ints
#       - if not valid triangle, return invalid
#       - return obtuse if any angle greater than 90
#       - return right if any angle is 90
#       - else return acute

def valid_triangle?(angles)
  angles.sum == 180 && angles.all? {|a| a > 0}
end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid if !valid_triangle?(angles)

  if angles.any? {|a| a > 90}
    return :obtuse
  elsif angles.any? {|a| a == 90}
    return :right
  else
    return :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
