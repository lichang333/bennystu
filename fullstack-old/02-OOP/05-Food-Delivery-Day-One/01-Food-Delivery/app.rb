# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'router.rb'
require_relative 'app/repositories/meal_repository.rb'
require_relative 'app/repositories/customer_repository.rb'
require_relative 'app/repositories/employee_repository.rb'
require_relative 'app/repositories/order_repository.rb'

require_relative 'app/controllers/meals_controller.rb'
require_relative 'app/controllers/customers_controller.rb'
require_relative 'app/controllers/orders_controller.rb'

meal_csv = File.join(__dir__, 'data/meals.csv')
customer_csv = File.join(__dir__, 'data/customers.csv')
employee_csv = File.join(__dir__, 'data/employees.csv')
order_csv = File.join(__dir__, 'data/orders.csv')


mealrepo = MealRepository.new(meal_csv)
customerrepo = CustomerRepository.new(customer_csv)
employeerepo = EmployeeRepository.new(employee_csv)
orderrepo = OrderRepository.new(order_csv, mealrepo, employeerepo, customerrepo)

meals_controller = MealsController.new(mealrepo)
customers_controller = CustomersController.new(customerrepo)
orders_controller = OrdersController.new(mealrepo, employeerepo, customerrepo, orderrepo)

router = Router.new(mealrepo: mealrepo, employeerepo: employeerepo, customerrepo: customerrepo, meals_controller: meals_controller, customers_controller: customers_controller, orders_controller: orders_controller)

router.run
