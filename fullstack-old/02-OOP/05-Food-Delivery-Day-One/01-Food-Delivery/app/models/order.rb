class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee, :delivered
  def initialize(attributes = {})
    @id = attributes[:id] || nil
    @customer = attributes[:customer]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
