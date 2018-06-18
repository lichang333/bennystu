
require_relative '../models/customer'
require_relative '../views/customer_viewer'
require_relative '../repositories/customer_repository'

class CustomersController
  def initialize(custrepo)
    @custrepo = custrepo
    @view = CustomerViewer.new
  end

  def list
    customers = @custrepo.all
    @view.display_customers(customers)
  end

  def add
    name = @view.new_customer("name")
    address = @view.new_customer("address")
    new_customer = Customer.new({name: name, address: address})
    @custrepo.add(new_customer)
  end
end
