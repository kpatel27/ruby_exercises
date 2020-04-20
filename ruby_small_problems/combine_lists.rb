#Write a method that combines two Arrays passed in as arguments,
#and returns a new Array that contains all elements from both Array arguments,
#with the elements taken in alternation.

def interleave(list1, list2)
  combined_list = []
  list1.each_with_index do |elem, index|
    combined_list << elem
    combined_list << list2[index]
  end
  combined_list
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
