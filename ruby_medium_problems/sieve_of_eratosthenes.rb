=begin
The Sieve of Eratosthenes is a simple, ancient algorithm for finding all
prime numbers up to any given limit. It does so by iteratively marking as
composite (i.e. not prime) the multiples of each prime, starting with the
multiples of 2.
=end

require 'minitest/autorun'

class Sieve
  def initialize(max_num)
    @list = create_list(max_num)
  end

  def create_list(max_num)
    #assume all numbers from 2..max_num are prime
    (2..max_num).each_with_object({}) { |num, hash| hash[num] = :is_prime}
    #{2 => :is_prime, 3 => :is_prime ... max_num => :is_prime }
  end

  def primes
    #find the first number marked :is_prime that is greater than the last prime number
    #initially 2 is the first prime number
    @list.each_key do |num|
      next if @list[num] == :not_prime
      mark_none_primes(num)
    end

    select_primes
  end

  def mark_none_primes(prime_num)
    #mark all multiples of prime_num, except prime_num itself, as :not_prime
    @list.each do |num, mark|
        next if prime_num == num
        @list[num] = :not_prime if num % prime_num == 0
    end
  end

  def select_primes
    @list.select {|_, mark| mark == :is_prime}.keys
  end
end

class SieveTest < Minitest::Test
  def test_a_few_primes
    expected = [2, 3, 5, 7]
    assert_equal expected, Sieve.new(10).primes
  end

  def test_primes
    expected = [
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
      61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
      131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191,
      193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257,
      263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331,
      337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401,
      409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467,
      479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563,
      569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631,
      641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709,
      719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
      809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877,
      881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967,
      971, 977, 983, 991, 997
    ]
    assert_equal expected, Sieve.new(1000).primes
  end
end
