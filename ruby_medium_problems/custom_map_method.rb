require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

def map(collection)
  result = []
  collection.each { |element| result << yield(element) }
  result
end

class TestMap < MiniTest::Test
  def test_empty_array
    method_call = map([]) { |value| true }
    assert_equal([], method_call)
  end

  def test_elements_squared
    method_call = map([1, 3, 6]) { |value| value**2 }
    assert_equal([1, 9, 36], method_call)
  end

  def test_false
    method_call = map(['a', 'b', 'c', 'd']) { |value| false }
    expecting = Array.new(4, false)
    assert_equal(expecting, method_call)
  end

  def test_upcase
    method_call = map(['a', 'b', 'c', 'd']) { |value| value.upcase }
    expecting = ('A'..'D').to_a
    assert_equal(expecting, method_call)
  end

  def test_range
    method_call = map([1, 3, 4]) { |value| (1..value).to_a }
    expecting = [[1], [1, 2, 3], [1, 2, 3, 4]]
    assert_equal(expecting, method_call)
  end

  def test_hash
    method_call = map({a:1, b:2, c:3}) {|_, value| value.to_s}
    expecting = ['1', '2', '3']
    assert_equal(expecting, method_call)
  end
end
