require_relative '../models/meal'
require 'csv'

class MealRepository
  def initialize(csv_path)
    @meals = []
    @csv_file = csv_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    read_csv if File.exist?(@csv_file)
  end

  def add(meal)
    meal.id = set_id
    @meals << meal
    save_to_csv
  end

  def read_csv
    CSV.foreach(@csv_file, @csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i          # Convert column to Integer
      @meals << Meal.new(row)
    end
  end

  def all
    @meals
  end

  def find(id)
    @meals.each do |meal|
      return meal if meal.id.to_i == id.to_i
    end
  end

  private

  def save_to_csv
    CSV.open(@csv_file, 'wb', @csv_options) do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def set_id
    @meals.last == nil ? 1 : @meals.last.id + 1
  end
end



      # repo = MealRepository.new('../../data/meals.csv')
      # p repo.meals
      # hawaii_meal = Meal.new(price: 11, name: 'Hawaii')
      # repo.add(hawaii_meal)
      # p '£££££££'
      # p repo.all
      # repo = MealRepository.new('../../data/meals.csv')
      # p repo.all
