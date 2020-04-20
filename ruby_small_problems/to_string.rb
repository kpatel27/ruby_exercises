#Write a method that takes a positive integer or zero, and converts it to a string representation.
DIGITS = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
}

def integer_to_string(integer)
  string_integer = ""

  loop do
    integer, remainder = integer.divmod(10)
    string_integer.prepend(DIGITS[remainder])
    break if integer == 0
  end
  string_integer
end
