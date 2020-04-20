=begin

Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate for that number.

UNDERSTANDING THE PROBLEM
==========================
Input: year as integer
Output: century as string

Rule: New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.
      Century ending in "1" append "st" to it (exception "11" which should append "th")
      Century ending in "2" append "nd" to it (exception "12" which should append "th")
      Century ending in "3" append "rd" to it (exception "13" which should append "th")
      Century ending in between "0" and "4" to "9" append "th" to it

EXAMPLE / TEST CASES
==========================
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

Edge Cases: 0 year should part of the 1st century

ALGORITHM
==========================
START

DEFINE century_string method which takes an integer as an argument
IF the argument is 0, RETURN "1st" century
IF the argument is 11 OR 12 OR 13, append "th" to argument
ELSE IF the argument ends in 1, append "st" to argument
ELSE IF the argument ends in 2, append "nd" to argument
ELSE IF the argument ends in 3, append "rd" to argument
ELSE append "th" to argument

DEFINE century method which takes an integer as an argument
IF the argument ends in 0, SET year to argument / 100
ELSE SET year to argument / 100 + 1
PASS year to century_string method

END

=end

def century_string(year)
  year = year.to_s

  return "1st" if year == "0"

  if ('11'..'13').include?(year[-2..-1])
    return year + "th"
  end

  last_digit = year[-1]

  case last_digit
  when "1"
    return year + "st"
  when "2"
    return year + "nd"
  when "3"
    return year + "rd"
  else
    return year + "th"
  end
end

def century(year)
  if year % 10 == 0
    year = year / 100
  else
    year = year / 100 + 1
  end
  century_string(year)
end
