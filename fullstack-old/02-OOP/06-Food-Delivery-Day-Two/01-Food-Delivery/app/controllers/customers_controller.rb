require_relative '../models/customer.rb'
require_relative '../repositories/customer_repository.rb'
require_relative '../views/view.rb'


class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = View.new
  end

  def list
    customer = @customer_repository.all
    @view.display_customers(customer)
  end

  def add
    name = @view.ask_customer_for("name")
    address = @view.ask_customer_for("address")
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end
end

