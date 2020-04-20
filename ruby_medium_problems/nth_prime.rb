#Write a program that can tell you what the nth prime is.

class Prime
  def self.nth(nth_prime)
    raise ArgumentError, "Must enter a number greater than 0" if nth_prime < 1
    return 2 if nth_prime == 1
    primes = [2, 3]
    while primes.size < nth_prime
      next_prime = primes.last + 2
      primes << next_prime unless primes.any? { |prime| next_prime % prime == 0}
    end
    primes.last
  end
end
