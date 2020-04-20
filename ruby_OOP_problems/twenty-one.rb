module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{hand_total}"
    puts ""
  end

  def hand_total
    total = 0
    cards.each do |card|
      if card.ace?
        total += 11
      elsif card.jack? || card.queen? || card.king?
        total += 10
      else
        total += card.face.to_i
      end
    end

    # correct for Aces
    cards.select(&:ace?).count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    hand_total > 21
  end
end

# <--------------PARTICIPANT CLASS-------------------->
class Participant
  include Hand

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end
end

# <--------------PLAYER CLASS--------------------?
class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, please enter a valid name."
    end
    self.name = name
  end

  def show_flop
    show_hand
  end
end

# <--------------DEALER CLASS-------------------->
class Dealer < Participant
  ROBOTS = %w(R2D2 Hal Chappie Bender)

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts "#{cards.first}"
    puts " ?? "
    puts ""
  end
end

# <--------------CARD CLASS-------------------->
class Card
  SUITS = %w(Heart Diamond Spades Clubs)
  FACES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  attr_reader :suit, :face

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def ace?
    face == 'Ace'
  end

  def jack?
    face == 'Jack'
  end

  def queen?
    face == 'Queen'
  end

  def king?
    face == 'King'
  end
end

# <--------------DECK CLASS-------------------->
class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

# <--------------GAME CLASS-------------------->
class Game
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    loop do
      clear_screen
      deal_cards
      show_flop

      player_turn
        if player.busted?
          show_busted
          if play_again?
            reset
            next
          else
            break
          end
        end

      dealer_turn
      if dealer.busted?
        show_busted
        if play_again?
          reset
          next
        else
          break
        end
      end

      show_cards
      show_results
      play_again? ? reset : break
    end

    puts "Thanks for playing 21!"
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def player_turn
    puts "#{player.name}'s turn...'"

    loop do
      puts "Would you like to (h)it or (s)tay?"
      answer = ''
      loop do
        answer = gets.chomp.downcase
        break if %w(h s).include?(answer)
        puts "Sorry, enter 'h' or 's'."
      end

      if answer == 's'
        puts "#{player.name} stays!"
        break
      elsif player.busted?
        break
      else
        player.add_card(deck.deal_one)
        puts "#{player.name} hits!"
        player.show_hand
        break if player.busted?
      end
    end
  end

  def dealer_turn
    puts "#{dealer.name}'s turn...'"

    loop do
      if dealer.hand_total >= 17 && !dealer.busted?
        puts "#{dealer.name} stays!"
        break
      elsif dealer.busted?
        break
      else
        puts "#{dealer.name} hits!"
        dealer.add_card(deck.deal_one)
      end
    end
  end

  def show_busted
    if player.busted?
      puts "#{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "#{dealer.name} busted! #{player.name} win!"
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_results
    if player.hand_total > dealer.hand_total
      puts "#{player.name} wins!"
    elsif dealer.hand_total > player.hand_total
      puts "#{dealer.name} wins!"
    elsif dealer.busted?
      puts "#{dealer.name} win!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again (y/n)?"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, enter a valid answer."
    end
    answer == 'y'
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end
end

Game.new.start
