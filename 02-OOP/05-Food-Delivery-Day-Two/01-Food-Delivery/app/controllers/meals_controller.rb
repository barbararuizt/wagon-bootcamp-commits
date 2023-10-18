require_relative "../models/meal"
require_relative "../views/meals_view"

class MealsController
  def initialize(repo)
    @repo = repo
    @view = MealsView.new
  end

  def add
    name = @view.ask_for('name')
    price = @view.ask_for('price').to_i
    meal = Meal.new(name: name, price: price)
    @repo.create(meal)
  end

  def list
    meals = @repo.all
    @view.display(meals)
  end

  def destroy
    list
    id = @view.ask_for('id').to_i
    @repo.delete(id)
  end
end
