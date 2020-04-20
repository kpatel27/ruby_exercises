#Write a method that takes one argument, a string, and returns a new string with the words in reverse order.
#Input:sentence
#Output: new reversed sentence
#Algorithm
=begin
  START

  -SET reversed_substring to an empty array
  -Split argument into substrings
  -LOOP through the substrings, removing the last element
    - Unshift the first elements to reversed_substring array
  -SET reversed_string to joined reversed_substring with a space
  Return reversed_string

  END
=end



def reverse_sentence(str)
  reversed_substring = []
  str.split.each {|sub_string| reversed_substring.unshift(sub_string)}
  reversed_string = reversed_substring.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

#Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

def reverse_words(str)
  reversed_substring = str.split.map do |substring|
                        if substring.length < 5
                          substring
                        else
                          substring.reverse
                        end
                       end
  reversed_substring.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
