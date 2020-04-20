require 'pry'

class Player
  attr_accessor :guessed_number

  def initialize
    @guessed_number = nil
  end

  def guess
    loop do
      self.guessed_number = gets.chomp.to_i
      break if (1..100).include?(guessed_number)
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
  end
end

class GuessingGame

  attr_reader :player, :winning_number, :max_guesses, :size_of_range
  attr_accessor :current_guess_count

  def initialize(size_of_range)
    @size_of_range = size_of_range
    @current_guess_count = 0
    @winning_number = (1..size_of_range).to_a.sample
    @player = Player.new
    @max_guesses = Math.log2(size_of_range).to_i + 1
  end

  def play
    loop do
      guesses_remaining_message
      guess_number_message
      guess_number
      display_result
      break if guessed_correctly? || out_of_guesses?
    end
    game_end_message
  end

  def guesses_remaining_message
    puts "You have #{guesses_left} guesses remaining."
  end

  def guess_number_message
    puts "Enter a number between 1 and 100:"
  end

  def guesses_left
    max_guesses - current_guess_count
  end

  def guess_number
    player.guess
    self.current_guess_count += 1
  end

  def display_result
    case
    when player.guessed_number == winning_number then puts "That's the number!"
    when player.guessed_number < winning_number then puts "Your guess is too low."
    else puts "Your guess is too high"
    end
  end

  def guessed_correctly?
    player.guessed_number == winning_number
  end

  def out_of_guesses?
    guesses_left.zero?
  end

  def game_end_message
    guessed_correctly?? puts("You won!") : puts("You have no more guesses. You lost!")
  end
end

GuessingGame.new(1000).play
