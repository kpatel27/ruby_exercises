#Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

puts "Please enter an integer greater than 0"
integer = gets.chomp.to_i
puts "Enter 's' for sum, and 'p' for product"
operation = gets.chomp

puts (1..integer).reduce(:+) if operation == ('s')
puts (1..integer).reduce(:*) if operation == ('p')
