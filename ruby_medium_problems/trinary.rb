=begin
Write a program that will convert a trinary number to its decimal equivalent

UNDERSTANDING THE PROBLEM
=========================
INPUT: number represented as a string
OUTPUT: integer

ALGORITHM
========================
Validate the input: only has 0, 1, 2
  IF it is invalid? RETURN 0
Convert the string number into an integer and assign it to a variable
Multiply each digit by 3^(string length - index - 1)
Add up the result of each multiplication

=end

class Trinary
  def initialize(string)
    @digits = string.chars
    @size = string.size
  end

  def to_decimal
    return 0 unless is_valid?

    @digits.each_with_index { |num, idx| @digits[idx] = num.to_i * 3**(@size - idx - 1) }
    @digits.reduce(:+)
  end

  def is_valid?
    @digits.join.match?(/[^012]/) == false
  end
end


require 'minitest/autorun'

class TrinaryTest < Minitest::Test
  def test_trinary_1_is_decimal_1
    assert_equal 1, Trinary.new('1').to_decimal
  end

  def test_trinary_2_is_decimal_2
    assert_equal 2, Trinary.new('2').to_decimal
  end

  def test_trinary_10_is_decimal_3
    assert_equal 3, Trinary.new('10').to_decimal
  end

  def test_trinary_11_is_decimal_4
    assert_equal 4, Trinary.new('11').to_decimal
  end

  def test_trinary_100_is_decimal_9
    assert_equal 9, Trinary.new('100').to_decimal
  end

  def test_trinary_112_is_decimal_14
    assert_equal 14, Trinary.new('112').to_decimal
  end

  def test_trinary_222_is_26
    assert_equal 26, Trinary.new('222').to_decimal
  end

  def test_trinary_1122000120_is_32091
    assert_equal 32_091, Trinary.new('1122000120').to_decimal
  end

  def test_invalid_trinary_is_decimal_0
    assert_equal 0, Trinary.new('carrot').to_decimal
  end

  def test_invalid_trinary_with_digits_is_decimal_0
    assert_equal 0, Trinary.new('0a1b2c').to_decimal
  end
end
