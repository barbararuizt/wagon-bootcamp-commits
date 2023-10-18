# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'router'

meals_csv_file = File.join(__dir__, 'data/meals.csv')
meals = MealRepository.new(meals_csv_file)

customers_csv_file = File.join(__dir__, 'data/customers.csv')
customers = CustomerRepository.new(customers_csv_file)

meals_controller = MealsController.new(meals)
customer_controller = CustomersController.new(customers)

router = Router.new(meals_controller, customer_controller)

router.run
