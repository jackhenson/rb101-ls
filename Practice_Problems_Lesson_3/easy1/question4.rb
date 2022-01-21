numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # deletes value at index 1, which is 2
                     # numbers is now [1, 3, 4, 5]
                     # returns removed value, 2
                     
numbers.delete(1) # deletes 1
                  # numbers is now [2, 3, 4, 5]
                  # returns removed values, 1