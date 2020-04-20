#Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order.


def reverse(array)
  new_list = array.clone
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    new_list[left_index], new_list[right_index] = new_list[right_index], new_list[left_index]
    left_index += 1
    right_index -= 1
  end

  new_list
end

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
