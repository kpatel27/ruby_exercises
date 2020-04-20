require 'pry'

class Board
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], #rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], #columns
    [1, 5, 9], [3, 5, 7] #diagonals
  ]

  attr_reader :squares

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def get_square_at(position)
    squares[position].marker
  end

  def set_square_at(position, marker)
    squares[position].marker = marker
  end

  def unmarked_squares
    squares.select { |_, square| square.marker == Square::INITIAL_MARKER}.keys
  end

  def full?
    unmarked_squares.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new}
  end

  def detect_winner
    WINNING_LINES.each do |line|
      if count_human_marker(squares.select{ |k, v| line.include?(k) }.values) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(squares.select{ |k, v| line.include?(k) }.values) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_welcome_message
    puts "Welcome to the Tic Tac Toe Game!"
    puts "================================"
  end

  def display_goodbye_message
    puts "Thanks for playing!"
  end

  def display_board
    puts "You are 'X' and the computer is 'O'"
    puts ""
    puts "     |     |     "
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}  "
    puts "     |     |     "
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def human_moves
    square = nil

    loop do
      puts "Choose a square: #{board.unmarked_squares.join(', ')}"
      square = gets.chomp.to_i
      break if board.unmarked_squares.include?(square)
      puts "Sorry, that is not a valid choice."
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_squares.sample, computer.marker)
  end

  def display_result
    clear_screen_and_display_board

    case board.detect_winner
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
    end

    answer == 'y'
  end

  def reset
    board.reset
    clear_screen
    puts "Playing again!"
  end

  def play
    display_welcome_message
    display_board

    loop do
      clear_screen_and_display_board

      loop do
        human_moves
        break if board.full? || board.someone_won?

        computer_moves
        break if board.full? || board.someone_won?

        clear_screen_and_display_board
      end

      display_result
      break unless play_again?
      reset
    end

    display_goodbye_message
  end
end

TTTGame.new.play
