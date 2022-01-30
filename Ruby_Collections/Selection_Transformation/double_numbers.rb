def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.length
    
    numbers[counter] *= 2

    counter += 1
  end
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers