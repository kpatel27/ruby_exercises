=begin
Write a method that takes an Array as an argument, and returns two Arrays
(as a pair of nested Arrays) that contain the first half and second half of the
original Array, respectively. If the original array contains an odd number of
elements, the middle element should be placed in the first half Array.
=end

def halvsies(array)
  middle = array.length / 2
  if array.length.even?
    array.partition {|num| array.index(num) < middle}
  else
    array.partition {|num| array.index(num) <= middle}
  end
end


halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
