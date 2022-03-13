# The time of day can be represented as the number 
# of minutes before or after midnight. If the number 
# of minutes is positive, the time is after midnight. 
# If the number of minutes is negative, the time is 
# before midnight.

# Write a method that takes a time using this minute-based 
# format and returns the time of day 
# in 24 hour format (hh:mm). Your method should work 
# with any integer input.

# You may not use ruby's Date and Time classes.

# FIRST ATTEMPT
# input: int, rep minutes
# output: string, time in 24 hour format (hh:mm)
# algorithm:
#   - convert mins input to 24 hr format
#   - if mins is negative, subtract from 24.00
#     - hrs.mins
#   - if mins is positive, add from 00:00

# def time_of_day(minutes)
#   hours = minutes.abs / 60
#   mins = minutes.abs % 60

#   if minutes > 1440
#     hours = minutes / 1440
#   elsif minutes < 0 && minutes.abs > 1440
#     hours = 23 - ((minutes.abs % 1440) / 60)
#     mins = 60 - mins
#   elsif minutes < 0
#     hours = 23 - hours
#     mins = 60 - mins
#   end

#   format_hrs = sprintf("%.2d", hours)
#   format_mins = sprintf("%.2d", mins)

#   "#{format_hrs}:#{format_mins}"
# end

# GIVEN SOLUTION
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"