# Build a program that asks a user for the length and width 
# of a room in meters and then displays the area of the room 
# in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# input: 2 ints or floats for length and width
# output: 2 floats, representing width in sq meters and sq ft

# algorithm
#   - multiply l x w to get area in sq meters
#   - convert sq m to sq ft

def display_area
  puts "Enter the length of the room in meters:"
  length = gets.to_f

  puts "Enter the width of the room in meters:"
  width = gets.to_f

  area_sq_m = (length * width).round(2)
  area_sq_ft = (area_sq_m * 10.7639).round(2)
  puts "The area of the room is #{area_sq_m} square meters (#{area_sq_ft} square feet)."
end

display_area