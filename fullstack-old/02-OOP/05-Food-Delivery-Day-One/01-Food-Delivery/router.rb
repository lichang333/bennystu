# TODO: implement the router of your app.
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/orders_controller'

require_relative 'app/models/employee'

require_relative 'app/repositories/employee_repository'
# require_relative 'app/repositories/customer_repository'
# require_relative 'app/repositories/meal_repository'
# require_relative 'app/repositories/order_repository'


class Router
  def initialize(attributes = {})
    @meals_controller = attributes[:meals_controller]
    @customers_controller = attributes[:customers_controller]
    @orders_controller = attributes[:orders_controller]

    @employeerepo = attributes[:employeerepo]
    @customerrepo = attributes[:customerrepo]
    @mealrepo = attributes[:mealrepo]
  end

  def enter_data(parameter)
    puts "                             "
    puts "-----------------------------"
    puts "Please enter your #{parameter}:"
    puts "-----------------------------"
    gets.chomp
  end

  def check_password
    if @employee.class == Array
      puts "Wrong credentials... Try again!"
      login
    else
      until @password == @employee.password
        puts "Wrong credentials... Try again!"
        login
      end
    end
    puts "Welcome #{@username}!"
  end

  def role_router(role)
    if @employee.role == "manager"
      manager_interface
    else
      delivery_guy_interface
    end
  end

  def delivery_guy_list
    puts "                             "
    puts "----------------------------------------"
    puts "please select an option from the list below"
    puts "----------------------------------------"

    puts "1. view my undelivered orders"
    puts "2. mark an order as delivered"
    puts "3. leave the app"
    puts "----------------------------------------"
    puts "                             "
    gets.chomp.to_i
  end

  # delivery guy calls
  def delivery_guy_interface
    selection = delivery_guy_list
    case selection
      when 1 then @orders_controller.list_my_orders(@employee)
      when 2 then @orders_controller.mark_as_delivered(@employee)
      when 3 then @leave_app = true
    end
  end

  def manager_list
    puts "1. add a meal"
    puts "2. view all the meals"
    puts "3. add a customer"
    puts "4. view all the customers"
    puts "5. view all the undelivered orders"
    puts "6. add an order for a customer and assign it to a delivery guy"
    puts "7. leave the app"
    puts "----------------------------------------"
    puts "please select an option from the list above"
    gets.chomp.to_i
  end

    # manager calls
  def manager_interface
    selection = manager_list
    case selection
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 3 then @customers_controller.add
      when 4 then @customers_controller.list
      when 5 then @orders_controller.list_undelivered_orders
      when 6 then @orders_controller.add
      when 7 then @leave_app = true
    end
  end

  def run
    puts "Welcome to the Restaurant app"
    puts "-----------------------------"
    puts "                             "
    login
  end

  def login
    @username = enter_data("username")
    @password = enter_data("password")
    @employee = @employeerepo.find_by_username(@username)
    check_password
    @leave_app = false
    while @leave_app == false
      role_router(@employee.role)
    end
  end
end
