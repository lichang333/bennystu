# Optional
require "Time"
require_relative 'bank_account'


class Transaction
  def initialize(amount, balance)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.now.strftime("%d/%m/%Y")
    @time = Time.now.strftime("%r")
    @balance = balance
    # to_s
    to_sf
  end

  def to_sf
    # Nicely print transaction info using Time#strftime.
    puts "#{@amount} euros on #{@date} at #{@time} \nYour new balance is #{@balance} "
  end
end


