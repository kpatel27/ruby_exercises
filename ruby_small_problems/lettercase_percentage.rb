#Write a method that takes a string, and then returns a hash that contains 3
#entries: one represents the percentage of characters in the string that are
#lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.
require 'pry'
require 'pry-byebug'


def case_counter(string)
  count = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    if ('a'..'z').include?(char)
      count[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      count[:uppercase] += 1
    else
      count[:neither] += 1
    end
  end
  count
end

def letter_percentages(string)
  count = case_counter(string)
  binding.pry
  total_words = count.values.sum.to_f
  percentage = count.map {|key, value| [key, (value / total_words * 100)]}
  percentage.to_h
end


letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
