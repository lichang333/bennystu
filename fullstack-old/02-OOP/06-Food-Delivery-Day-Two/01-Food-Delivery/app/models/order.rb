class Order
  attr_accessor :id, :delivered, :meal, :employee, :customer
  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @employee = attributes [:employee]
    @customer = attributes[:customer]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
