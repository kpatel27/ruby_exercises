class CaesarCipher
  UPCASE_ALPHBT_ORD_RANGE = (65..90)
  DOWNCASE_ALPHBT_ORD_RANGE = (97..122)
  LETTERS_IN_ALPHABET = 26

  def initialize(string, shift)
    @string = string
    @shift = shift
  end

  def self.rotate(string, shift)
    new(string, shift).rotate
  end

  def rotate
    result = ""

    @string.chars.each do |char|
      result += char.match?(/[a-zA-Z]/) ? transpose(char) : char
    end

    result
  end

  def transpose(char)
    char_ord = char.ord + @shift

    if char.match?(/[A-Z]/) && char_ord > UPCASE_ALPHBT_ORD_RANGE.last
      (char_ord - LETTERS_IN_ALPHABET).chr
    elsif char.match?(/[a-z]/) && char_ord > DOWNCASE_ALPHBT_ORD_RANGE.last
      (char_ord - LETTERS_IN_ALPHABET).chr
    else
      char_ord.chr
    end
  end
end
