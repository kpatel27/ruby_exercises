=begin

Write a method that counts the number of occurrences of each element in a given array.

Input: array
Output: hash where the occurrence is the key and the number of occurrences is the value
Rules: case sensetive

Algorithm:
START

-DEFINE method count_occurrences
-SET key_value to an empty array
-LOOP through the array
  -use #count method to determine the number of occurences for each object
  -push current element and count to key_value array
  - skip current iteration if element is inside key_value
-Convert key_value array to hash using #to_h
-print key_value

END

=end


def count_occurrences(array)
  key_value = []
  array.each do |element|
    next if key_value.flatten.include?(element)
    key_value << [element, array.count(element)]
  end
  puts key_value.to_h
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
