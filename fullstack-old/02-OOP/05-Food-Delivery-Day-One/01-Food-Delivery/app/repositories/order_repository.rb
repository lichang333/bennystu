require_relative '../models/order'
require_relative '../repositories/meal_repository'
require_relative '../repositories/customer_repository'
require_relative '../repositories/employee_repository'
require 'csv'

class OrderRepository

  def initialize(csv_path, meal_repo, employee_repo, customer_repo)
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @orders = []
    @csv_path = csv_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    read_from_csv if File.exist?(@csv_path)
  end



  def add(order)
    order.id = set_id
    @orders << order
    save_to_csv
  end

  def all
    @orders
  end

  def read_from_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:customer_id] = row[:customer_id].to_i
      row[:meal_id] = row[:meal_id].to_i
      row[:employee_id] = row[:employee_id].to_i
      row[:delivered] = row[:delivered] == "true"
      meal = @meal_repository.find(row[:meal_id])
      customer = @customer_repository.find(row[:customer_id])
      employee = @employee_repository.find(row[:employee_id])

      @orders << Order.new(id: row[:id], meal: meal, customer: customer,employee: employee, delivered: row[:delivered])
    end
  end

  def find(id)
    @orders.each do |order|
      return order if order.id.to_i == id.to_i
    end
  end

  def undelivered_orders
    @undelivered_orders = []
    @orders.each do |order|
      @undelivered_orders << order if order.delivered? == false
    end
    @undelivered_orders
  end

  def employee_orders(employee_id)
    @employee_orders = []
    @orders.each do |order|
      @employee_orders << order if order.employee.id == employee_id  && order.delivered? == false
    end
    @employee_orders
  end



  def save_to_csv
    CSV.open(@csv_path, 'wb', @csv_options) do |csv|
      csv << ["id","delivered","meal_id","employee_id","customer_id"]
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

  private

  def set_id
    @orders.last == nil ? 1 : @orders.last.id + 1
  end

end

