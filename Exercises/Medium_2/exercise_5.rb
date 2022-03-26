# A triangle is classified as follows:

#     equilateral All 3 sides are of equal length
#     isosceles 2 sides are of equal length, while the 3rd is different
#     scalene All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the 
# two shortest sides must be greater than the length of 
# the longest side, and all sides must have 
# lengths greater than 0: if either of these conditions 
# is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of 
# a triangle as arguments, and returns 
# a symbol :equilateral, :isosceles, :scalene, or :invalid 
# depending on whether the triangle is 
# equilateral, isosceles, scalene, or invalid.

# input: 3 int, lengths of triangle sides
# output: symbol, representing type of triangle
# algorithm:
#   - initialize triangle type hsh
#   - initialize sorted arr with input ints
#   - initialize variables assigned to side ints: long side2 side3
#   - if not valid triangle, return :invalid
#   - return hsh key for corresponding true value

#   - VALID TRIANGLE METHOD
#     - if input ints all > 0
#     - if sum of small sides > largest side

def valid_triangle?(sides)
  sides.all? {|side| side > 0} && (sides[-1] < (sides[0] + sides[1]))
end

def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  long = sides[-1]
  side2 = sides[0]
  side3 = sides[1]
  return :invalid if !valid_triangle?(sides)

  if long == side2 && side2 == side3
    :equilateral
  elsif sides == sides.uniq
    :scalene
  else
    :isosceles
  end
end

# GIVEN SOLUTION
# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3]
#   largest_side = sides.max

#   case
#   when 2 * largest_side > sides.reduce(:+), sides.include?(0)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side1 == side3 || side2 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid