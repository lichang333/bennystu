require_relative '../repositories/meal_repository.rb'
require_relative '../views/view.rb'
require_relative '../models/meal.rb'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def list
    meals = @meal_repository.all
    @view.display_meals(meals)
  end

  def add
    name = @view.ask_user_for("name")
    price = @view.ask_user_for("price")
    meal = Meal.new(name: name, price: price.to_i)
    @meal_repository.add(meal)
    list
  end
end
