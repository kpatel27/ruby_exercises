#Write a method that calculates and returns the index of the first Fibonacci
#number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length(length)
  fibonacci_sequence = [1, 1]

  until fibonacci_sequence.last.to_s.size >= length
    fibonacci_sequence << fibonacci_sequence[-2] + fibonacci_sequence[-1]
  end
  fibonacci_sequence.length
end
