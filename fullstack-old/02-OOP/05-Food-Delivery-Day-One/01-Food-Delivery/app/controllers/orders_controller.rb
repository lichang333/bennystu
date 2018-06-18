require_relative '../repositories/meal_repository'
require_relative '../repositories/customer_repository'
require_relative '../repositories/order_repository'
require_relative '../repositories/employee_repository'
require_relative '../views/order_viewer'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repo, employee_repo, customer_repo, order_repo)
    @meal_repository = meal_repo
    @order_repository = order_repo
    @employee_repository = employee_repo
    @customer_repository = customer_repo
    @view = OrderViewer.new
  end

  def list_undelivered_orders
    @view.display_orders(@order_repository.undelivered_orders)
  end

  def add
    meal_id = @view.new_order("Meal ID").to_i
    customer_id = @view.new_order("Customer ID").to_i
    employee_id = @view.new_order("Employee ID").to_i

    meal = @meal_repository.find(meal_id)
    customer = @customer_repository.find(customer_id)
    employee = @employee_repository.find(employee_id)

    order = Order.new(meal: meal, customer: customer,employee: employee)
    @order_repository.add(order)
  end

  def list_my_orders(employee)
    @view.display_orders(@order_repository.employee_orders(employee.id))
  end

  def mark_as_delivered(employee)
    order_id = @view.order_is_delivered
    order = @order_repository.find(order_id)
    order.deliver!
    @order_repository.save_to_csv
  end

end

