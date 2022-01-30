def double_odd_index(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.length

    numbers[counter] *= 2 if counter.odd?
    doubled_numbers << numbers[counter]

    counter += 1
  end
  
  doubled_numbers
end


my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_index(my_numbers)


