# 1000 Lights


# You have a bank of switches before you, 
# numbered from 1 to n. Each switch is connected 
# to exactly one light that is initially off. You 
# walk down the row of switches and toggle every 
# one of them. You go back to the beginning, and 
# on this second pass, you toggle switches 
# 2, 4, 6, and so on. On the third pass, you go 
# back again to the beginning and toggle switches 
# 3, 6, 9, and so on. You repeat this process and 
# keep going until you have been through n repetitions.

# Write a method that takes one argument, the total 
# number of switches, and returns an Array that 
# identifies which lights are on after n repetitions.

# Example with n = 5 lights:

#     round 1: every light is turned on
#     round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#     round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#     round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
#     round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, 
# lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: 
# lights 1, 4, and 9. The return value is [1, 4, 9].

# input: n, total num of switches
# output: arr, nums of switches turned on after n repetitions
# data: hash
# algorithm:
#       - create hash with keys ints, from 1 to n
#         - values contain str object 'off'
#       - iterate over range of ints, 1..n
#         - if hash key is divisible by int with no remainder
#           - toggle switch, if 'on' then 'off' and vice versa
#       - from hash, select entries with 'on' values
#       - return those keys

def toggle_lights(n)
  lights = (1..n).each_with_object({}) {|num, hsh| hsh[num] = 'off'}
  for num in 1..n
    lights.keys.each do |key|
      if key % num == 0
        lights[key] == 'on' ? lights[key] = 'off' : lights[key] = 'on'
      end
    end
  end

  lights.select {|k, v| v == 'on'}.keys
end

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
