# Imagine a sequence of consecutive even integers 
# beginning with 2. The integers are grouped in rows, 
# with the first row containing one integer, the 
# second row two integers, the third row three 
# integers, and so on. Given an integer representing 
# the number of a particular row, return an integer 
# representing the sum of all the integers in that row.

# p sum_even_number_row(1) == 2 
# p sum_even_number_row(2) == 10
# p sum_even_number_row(4) == 68

# input: int, num of row
# output: int, sum of nums in input row
# algo:
#     - initialize rows arr
#     - initialize current num to 2
#     - initialize row num to 1
#     - until rows arr size equals input
#       - initialize current row arr
#       - until row arr size equals row num
#         - add current num to row arr
#         - increase current num by 2
#       - append current row to rows arr
#    - return sum of final row

def sum_even_number_row(int)
  rows_arr = []
  current_num = 2
  (1..int).each do |i|
    current_row = []
    until current_row.size == i
      current_row << current_num
      current_num += 2
    end
    rows_arr << current_row
  end
  rows_arr.last.sum
end 

# def sum_even_number_row(int)
#   rows_arr = []
#   current_num = 2
#   row_num = 1
#   until rows_arr.size >= int
#     current_row = []
#     until current_row.size >= row_num
#       current_row << current_num
#       current_num += 2
#     end
#     rows_arr << current_row
#     row_num += 1
#   end
#   rows_arr.last.sum
# end

p sum_even_number_row(1) == 2 
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68