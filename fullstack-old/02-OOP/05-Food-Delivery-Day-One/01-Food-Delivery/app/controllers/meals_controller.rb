require_relative '../models/meal'
require_relative '../views/meal_viewer'
require_relative '../repositories/meal_repository'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = MealViewer.new
  end

  def list
    @view.display_meals(@meal_repo.all)
  end

  def add
    name = @view.new_meal("name")
    price = @view.new_meal("price").to_i
    meal = Meal.new(name: name, price: price)
    @meal_repo.add(meal)
  end
end
