#Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.
#This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.

def real_palindrome?(string)
  alphanumeric = ('a'..'z').to_a + ('0'..'9').to_a
  palindrome_chars = string.downcase.chars.select {|char| alphanumeric.include?(char)}
  palindrome_chars.join.reverse == palindrome_chars.join
end

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
