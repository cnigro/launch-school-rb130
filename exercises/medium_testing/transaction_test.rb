require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(20)
    payment = StringIO.new('20\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: payment, output: output)
    $stdout = STDOUT
    assert_equal 20, transaction.amount_paid
  end
end