require_relative "view_cookbook.rb"
require_relative "cookbook.rb"
require_relative "recipe.rb"

class Controller
  # takes an instance of the `Cookbook` as an argument
  def initialize(cookbook)
    @cookbook = cookbook
    @view = ViewCookbook.new(@cookbook)
  end

  # lists all the recipes
  def list
    @view.listing
  end

  # creates a new recipe
  def create
    recipe_name = @view.ask_name
    recipe_description = @view.ask_description
    recipe = Recipe.new(recipe_name, recipe_description)
    @cookbook.add_recipe(recipe)
    @view.listing
  end

  # destroys an existing recipe
  def destroy
    recipe_index = @view.index_delete
    @cookbook.remove_recipe(recipe_index)
    @view.listing
  end
end

