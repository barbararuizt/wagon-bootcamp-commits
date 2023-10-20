# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/orders_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'
require_relative 'router'

meals_csv_file = File.join(__dir__, 'data/meals.csv')
meals = MealRepository.new(meals_csv_file)

customers_csv_file = File.join(__dir__, 'data/customers.csv')
customers = CustomerRepository.new(customers_csv_file)

employees_csv_file = File.join(__dir__, 'data/employees.csv')
employees = EmployeeRepository.new(employees_csv_file)

orders_csv_file = File.join(__dir__, 'data/orders.csv')
orders = OrderRepository.new(orders_csv_file, meals, customers, employees)

meals_controller = MealsController.new(meals)
customer_controller = CustomersController.new(customers)
sessions_controller = SessionsController.new(employees)
orders_controller = OrdersController.new(meals, customers, employees, orders)

router = Router.new(meals_controller, customer_controller, sessions_controller, orders_controller)

router.run
