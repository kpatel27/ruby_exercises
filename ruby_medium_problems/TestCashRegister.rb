require 'minitest/autorun'
require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction1 = Transaction.new(50)
    @transaction2 = Transaction.new(20)
  end

  def test_accept_money
    @transaction1.amount_paid = 50
    @register.accept_money(@transaction1)
    new_amount = @register.total_money

    assert_equal(150, new_amount)
  end

  def test_change
    @transaction1.amount_paid = 60
    change = @register.change(@transaction1)

    assert_equal(10, change)

    @transaction2.amount_paid = 20
    change = @register.change(@transaction2)

    assert_equal(0, change)
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") do
      @register.give_receipt(@transaction1)
    end
  end
end

class TransactionTest < Minitest::Test
  def prompt_for_payment(input: $stdin) # We've set a default parameter for stdin
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    transaction.prompt_for_payment # payment must be 30. If not error will be raised.
    assert_equal(30, transaction.amount_paid)
  end
end
