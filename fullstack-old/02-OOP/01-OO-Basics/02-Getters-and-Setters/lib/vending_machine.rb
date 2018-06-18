class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.
  attr_reader :amount_cents, :snack_price_cents
  attr_accessor :snacks
  def initialize(snack_price_cents, snacks)
    @amount_cents = 0
    @snacks = snacks
    @snack_price_cents = snack_price_cents
  end

  def insert_coin(value_cents)
    @amount_cents += value_cents
  end

  def buy_snack
    if @amount_cents >= @snack_price_cents && @snacks > 0
      puts "dispensing snack"
      @amount_cents -= @snack_price_cents
      @snacks -= 1
    elsif @snacks.zero?
      "No snacks left"
    else
      "Not enough credit, please insert coins"
    end
  end
end


