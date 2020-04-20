require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

def none?(list)
  list.each { |num| return false if yield(num) }
  true
end


class NoneTest < MiniTest::Test
  def setup
    @arr1 = [1,2,3,4,5]
    @arr2 = [1,3,5,7,9]
    @arr3 = [-4, 8, 0]
    @arr4 = [-14, -7, -10]
  end

  def test_1
    refute(none?(@arr1) { |num| num.even?})
  end

  def test_2
    refute(none?(@arr1) { |num| num.odd?})
  end

  def test_3
    assert(none?(@arr2) { |num| num.even?})
  end

  def test_4
    refute(none?(@arr2) { |num| num.odd?})
  end

  def test_5
    refute(none?(@arr3) { |num| num.negative?})
  end

  def test_6
    refute(none?(@arr3) { |num| num.positive?})
  end

  def test_7
    assert(none?(@arr4) { |num| num.positive?})
  end

  def test_8
    refute(none?(@arr4) { |num| num.negative?})
  end

  def test_9
    assert(none?([]) { |num| true })
  end
end
