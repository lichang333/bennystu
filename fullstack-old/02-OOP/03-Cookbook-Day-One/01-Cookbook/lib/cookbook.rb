require 'csv'

class Cookbook
  attr_reader :cookbook
  # loads existing `Recipe` from the CSV
  def initialize(csv_file_filepath)
    @csv_file_filepath = csv_file_filepath
    @cookbook = []
    CSV.foreach(@csv_file_filepath) do |csv|
      @cookbook << Recipe.new(csv[0], csv[1])
    end
    # headers: :first_row
  end

  # returns all the recipes
  def all
    @cookbook
  end

  # adds a new recipe to the cookbook
  def add_recipe(recipe)
    @cookbook << recipe
    CSV.open(@csv_file_filepath, 'wb') do |csv|
      @cookbook.each do |item|
        csv << [item.name, item.description]
      end
    end
  end


  # def add_recipe (recipe)
  #   @cookbook << recipe
  #   #p recipe.class
  #   CSV.open(@csv_file_filepath, 'a') do |csv|
  #     csv << @cookbook
  #   end
  # end

  # removes a recipe from the cookbook
  def remove_recipe(recipe_index)
    @cookbook.delete_at(recipe_index)
    CSV.open(@csv_file_filepath, 'wb') do |csv|
      @cookbook.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
