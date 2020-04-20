#Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

puts "==> Please write a word or multiple words:"
input = gets.chomp
length = input.split.reduce(0) {|sum, word| sum + word.length}
puts "There are #{length} characters in ''#{input}''"
