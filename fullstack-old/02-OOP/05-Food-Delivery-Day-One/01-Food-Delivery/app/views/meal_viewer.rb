class MealViewer
  def initialize
  end

  def display_meals(meal_instances_array)
    meal_instances_array.each do |meal|
      puts "#{meal.id}. #{meal.name} #{meal.price}"
    end
  end

  def new_meal(parameter)
    puts "what is the #{parameter} of your new meal"
    gets.chomp
  end
end
