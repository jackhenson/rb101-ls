# Take a look at the following code:

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# What does this code print out? Think about it 
# for a moment before continuing.

# If you said that code printed

# Alice
# Bob

# you are 100% correct, and the answer should come as 
# no surprise. Now, let's look at something a bit different:

# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# What does this print out? Can you explain these results?

# name = 'Bob'
# local variable 'name' initialized and set to str object 'Bob'

# save_name = name
# local variable 'save_name' initialized and set to
#   the same value as local variable 'name'
#   both local variables now point at str object 'Bob'

# name.upcase!
# the upcase! destructively modifies the str object pointed
#   to by the local variable, name
#   the local variable 'save_name' also points to str object

# puts name, save_name
# prints:
# BOB
# BOB