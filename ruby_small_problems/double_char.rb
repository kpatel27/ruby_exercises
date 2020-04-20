#Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  string.chars.map {|char| char * 2}.join
end

p repeater('Hello')
p repeater("Good job!")
p repeater('')
