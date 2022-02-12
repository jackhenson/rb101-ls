# return an array which contains only the hashes 
#   where all the integers are even

arr = [{a: [1, 2, 3]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do | hash |
  hash.all? do | _, value |
    value.all? do | num |
      num.even?
    end
  end
end

p new_arr
