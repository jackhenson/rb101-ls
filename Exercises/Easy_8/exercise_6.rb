# Write a method that takes two arguments: 
# the first is the starting number, and 
# the second is the ending number. Print out 
# all numbers between the two numbers, except 
# if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", 
# and finally if a number is 
# divisible by 3 and 5, print "FizzBuzz".

# input: 2 int, starting num and ending num
# output: print all nums between start and end nums
#         - if num divisable by 3, print 'Fizz'
#         - if num divisable by 5, print 'Buzz'
#         - if num is divisable by 3 and 5, print 'FizzBuzz'

# algorithm:
#       - interate over range of start to end num
#         - print nums as defined by rules

def fizzbuzz(num1, num2)
  result = []
  for num in num1..num2
    if num % 3 == 0 && num % 5 == 0
      result << 'FizzBuzz'
    elsif num % 3 == 0
      result << 'Fizz'
    elsif num % 5 == 0
      result << 'Buzz'
    else
      result << num
    end
  end

  result.join(' ')
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz