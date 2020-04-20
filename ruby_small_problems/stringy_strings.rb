=begin

Write a method that takes one argument, a positive integer, and returns a string of alternating
1s and 0s, always starting with 1. The length of the string should match the given integer.

Understanding the problem
==========================
Input: positive integer
Output: string of 1s and 0s

Rules:
  1. Must be positive whole number
  2. Must start with 1
  3. Must be the length of the argument

Examples/Test Cases
====================
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Algorithm
====================
START

-SET string to "10"
-Multiply string by half the argument
-If argument is_odd?, concatenate "1" into the end of string
-Return string

END

=end

def stringy(length = 1)
  str = "10"
  str *= length / 2
  str += "1" if length.odd?
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy
