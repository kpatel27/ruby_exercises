=begin
Write a program that, given a number, can find the sum of all the multiples of
particular numbers up to but not including that number.

UNDERSTANDING THE PROBLEM
=========================
INPUT: Integer
OUTPUT: Integer that is sum of all multiples not including the number

DATA STRUCTURE
=========================
Array to hold the multiples

ALGORITHM
=========================
Initialze an empty array and assign it to Multiples
IF set of numbers are given
  PUSH multiples of all numbers in the set up to input to the array Multiples
ELSE
  PUSH multiples of 3 and 5 up to the input to the array Multiples
END
=end

class SumOfMultiples
  def initialize(*factors)
    factors.empty? ? @factors = [3, 5] : @factors = factors
  end

  def self.to(max)
    SumOfMultiples.new.to(max)
  end

  def to(max)
    multiples = []
    @factors.each do |factor|
      (factor...max).each { |num| multiples << num if num % factor == 0 }
    end
    multiples.uniq.reduce(0) {|acc, num| acc + num}
  end

end




require 'minitest/autorun'

class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end
