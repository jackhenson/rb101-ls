def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # prints 'one'
puts "two is: #{two}" # prints 'two'
puts "three is: #{three}" # prints 'three'


######################################

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # prints 'one'
puts "two is: #{two}" # prints 'two'
puts "three is: #{three}" # prints 'three'

######################################

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # prints 'two'
puts "two is: #{two}" # prints 'three'
puts "three is: #{three}" # prints 'one'