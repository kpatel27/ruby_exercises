#Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array.

def average(array)
  sum = array.reduce(0) { |sum, num| sum + num }
  sum / array.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
