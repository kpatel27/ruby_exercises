=begin
Perfect: Sum of factors = number
Abundant: Sum of factors > number
Deficient: Sum of factors < number
=end

class PerfectNumber
  def self.classify(n)
    raise(RuntimeError, "Enter a number greater than 0") if n < 1
    
    factors = (1...n).select { |num| n % num == 0 }
    sum_of_factors = factors.reduce(:+)

    case
    when sum_of_factors == n then 'perfect'
    when sum_of_factors > n then 'abundant'
    else 'deficient'
    end
  end
end

require 'minitest/autorun'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end
