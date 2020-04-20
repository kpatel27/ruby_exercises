require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

def count(items)
  total = 0
  items.each do |item|
    total += 1 if yield(item)
  end
  total
end

class CountItemsTest < MiniTest::Test
  def setup
    @arr1 = [1, 2, 3, 4, 5]
  end

  def test_1
    assert_equal(3, count(@arr1) { |value| value.odd? })
  end

  def test_2
    assert_equal(2, count(@arr1) { |value| value % 3 == 1 })
  end

  def test_3
    assert_equal(5, count(@arr1) { |value| true })
  end

  def test_4
    assert_equal(0, count(@arr1) { |value| false })
  end

  def test_5
    assert_equal(0, count([]) { |value| value.even? })
  end

  def test_6
    assert_equal(2, count(%w(Four score and seven)) { |value| value.size == 5 })
  end
end
