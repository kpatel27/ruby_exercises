=begin
Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be unchanged.
=end
LOWER_UPPER_CASES = {
  'a' => 'A', 'b' => 'B', 'c' => 'C',
  'd' => 'D', 'e' => 'E', 'f' => 'F',
  'g' => 'G', 'h' => 'H', 'i' => 'I',
  'j' => 'J', 'k' => 'K', 'l' => 'L',
  'm' => 'M', 'n' => 'N', 'o' => 'O',
  'p' => 'P', 'q' => 'Q', 'r' => 'R',
  's' => 'S', 't' => 'T', 'u' => 'U',
  'v' => 'V', 'w' => 'W', 'x' => 'X',
  'y' => 'Y', 'z' => 'Z'
}

def swapcase(string)
  case_swapped_str = string.chars.map do |char|
                       if LOWER_UPPER_CASES[char]
                         LOWER_UPPER_CASES[char]
                       elsif LOWER_UPPER_CASES.key(char)
                         LOWER_UPPER_CASES.key(char)
                       else
                         char
                       end
                     end
  case_swapped_str.join
end

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
