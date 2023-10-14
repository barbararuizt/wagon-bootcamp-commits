# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/controllers/meals_controller'
require_relative 'app/models/meal'
require_relative 'router'

csv_file = File.join(__dir__, 'data/meals.csv')
meals = Meal.new(csv_file)
controller = MealsController.new(meals)

router = Router.new(controller)

router.run
