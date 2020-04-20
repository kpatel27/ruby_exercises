#Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

numbers = []
6.times do
  puts "==> Please enter a number"
  number = gets.chomp.to_i
  numbers << number
end

target = numbers.pop

puts "The number, #{target}, does #{numbers.include?(target) ? "appears" : "not appear"} in #{numbers}."
