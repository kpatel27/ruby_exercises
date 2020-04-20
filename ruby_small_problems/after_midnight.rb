#Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm).

def time_of_day(minutes)
  time = ""
  minute = minutes % 60
  hour = minutes / 60 % 24
  puts hour
  time.prepend(minute.to_s)
  time.prepend(':')
  time.prepend(hour.to_s)
  time
end
