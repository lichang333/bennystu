require_relative 'app/repositories/meal_repository.rb'
require_relative 'app/repositories/customer_repository.rb'
require_relative 'app/repositories/employee_repository.rb'
require_relative'app/controllers/sessions_controller.rb'
require_relative 'app/repositories/order_repository.rb'
require_relative 'app/controllers/meals_controller.rb'
require_relative 'app/controllers/customers_controller.rb'
require_relative 'app/controllers/orders_controller.rb'
require_relative 'router'

MEALS_FILE = File.join(File.dirname(__FILE__), 'meals.csv')
meal_repository = MealRepository.new(MEALS_FILE)
meals_controller = MealsController.new(meal_repository)

CUSTOMERS_FILE = File.join(File.dirname(__FILE__), 'customers.csv')
customer_repository = CustomerRepository.new(CUSTOMERS_FILE)
customers_controller = CustomersController.new(customer_repository)

EMPLOYEES_FILE = File.join(File.dirname(__FILE__), 'employees.csv')
employee_repository = EmployeeRepository.new(EMPLOYEES_FILE)
sessions_controller = SessionsController.new(employee_repository)

ORDERS_FILE = File.join(File.dirname(__FILE__), 'orders.csv')
order_repository = OrderRepository.new(ORDERS_FILE, meal_repository, employee_repository, customer_repository)
orders_controller = OrdersController.new(order_repository, meal_repository, employee_repository, customer_repository)

router = Router.new(sessions_controller, meals_controller, customers_controller, orders_controller)

router.login
router.run
