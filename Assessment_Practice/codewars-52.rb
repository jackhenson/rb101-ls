# A child is playing with a ball on the nth floor 
# of a tall building. The height of this floor, h, is known.

# He drops the ball out of the window. The ball 
# bounces (for example), to two-thirds of 
# its height (a bounce of 0.66).

# His mother looks out of a window 1.5 meters 
# from the ground.

# How many times will the mother see the ball pass in front 
# of her window (including when it's falling and bouncing?
# Three conditions must be met for a valid experiment:

#     Float parameter "h" in meters must be greater than 0
#     Float parameter "bounce" must be greater than 0 and less than 1
#     Float parameter "window" must be less than h.

# If all three conditions above are fulfilled, return a positive integer, 
# otherwise return -1.

# Note:

# The ball can only be seen if the height of the rebounding ball is 
# strictly greater than the window parameter.

# Examples:

# h = 3, bounce = 0.66, window = 1.5, result is 3

# h = 3, bounce = 1, window = 1.5, result is -1 

# p bouncingBall(3, 0.66, 1.5) == 3
# p bouncingBall(30, 0.66, 1.5) == 15
# p bouncingBall(30, 0.75, 1.5) == 21
# p bouncingBall(30, 0.4, 10) == 3
# p bouncingBall(40, 1, 10) == -1
# p bouncingBall(-5, 0.66, 1.5) == -1



# input: ints, h bounce window
# output: int, times ball passes window
# algo:
#     - unless h >0, 1 > bounce > 0, and window < h, return -1
#     - initialize pass_window to 1
#     - initialize bounce height to h*bounce
#     - until bounce height is less than or equal to window
#       - pass_window += 2
#       - bounce height = bounce height * bounce
#     - return pass_window

def bouncingBall(h, bounce, window)
  return -1 unless (h > 0 && 1 > bounce && bounce > 0 && window < h)
  pass_window = 1
  bounce_height = (h*bounce)
  until bounce_height <= window
    pass_window +=2
    bounce_height *= bounce
  end
  pass_window
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
