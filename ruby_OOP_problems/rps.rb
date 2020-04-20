class Move
  VALUES = ['rock', 'paper', 'scissors']
  def initialize(value)
    @choice = value
  end

class Player
  attr_accessor :move

  def initialize(player)
    @player = player
    @move = nil
  end

  def choose
    if human?
      choice = nil

      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp

        break if %w(paper rock scissors).include?(choice)

        puts "Invalid choice"
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner

      break unless play_again?
    end

    display_goodbye_message
  end

  def play_again?
    answer = nil

    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp

      break if %w(y n).include?(answer)
      puts "Sorry, please enter 'y' or 'n'"
    end

    return true if answer == 'y'
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing! Goodbye!"
  end

  def display_winner
    puts "You chose #{human.move}"
    puts "Computer chose #{computer.move}"

    if human.move > computer.move
      puts "You won!"
    elsif human.move < computer.move
      puts "You lost!"
    else
      puts "It's a tie!"
    end

    case human.move
    when 'rock'
      puts "You won!" if computer.move == 'scissors'
      puts "Computer won!" if computer.move == 'paper'
      puts "Tie game!" if computer.move == 'rock'
    when 'paper'
      puts "You won!" if computer.move == 'rock'
      puts "Computer won!" if computer.move == 'scissors'
      puts "Tie game!" if computer.move == 'paper'
    when 'scissors'
      puts "You won!" if computer.move == 'paper'
      puts "Computer won!" if computer.move == 'rock'
      puts "Tie game!" if computer.move == 'scissors'
    end
  end
end

RPSGame.new.play
