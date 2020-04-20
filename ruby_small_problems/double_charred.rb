#Write a method that takes a string, and returns a new string in which every
#consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
#whitespace should not be doubled.

def is_consonant?(char)
  ('a'..'z').include?(char.downcase) && !%w(a e i o u).include?(char)
end

def double_consonants(string)
  string.chars.map {|char| is_consonant?(char) ? char * 2 : char }.join
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
