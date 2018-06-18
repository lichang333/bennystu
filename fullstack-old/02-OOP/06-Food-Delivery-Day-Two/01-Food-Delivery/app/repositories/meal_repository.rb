require 'csv'
require_relative '../models/meal.rb'

class MealRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @meals = []
    load_csv
  end

  def load_csv
    if File.exist?(@csv_filepath)
        csv_options = { headers: :first_row, header_converters: :symbol }
        CSV.foreach(@csv_filepath, csv_options) do |row|
        row[:id] = row[:id].to_i
        row[:price] = row[:price].to_i
        @meals << Meal.new(row)
        end
    end
      @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_to_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_filepath, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def all
    @meals
  end

  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_to_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id}
  end
end
