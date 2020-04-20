#Write a method that determines and returns the ASCII string value of a string that is passed in as an argument

def ascii_value(string)
  string.chars.reduce(0) {|sum, char| sum + char.ord}
end
