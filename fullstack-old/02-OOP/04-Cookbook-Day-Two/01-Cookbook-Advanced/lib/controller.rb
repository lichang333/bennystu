require_relative "view_cookbook.rb"
require_relative "cookbook.rb"
require_relative "recipe.rb"
require_relative "scraper.rb"

class Controller
  # takes an instance of the `Cookbook` as an argument
  def initialize(cookbook)
    @cookbook = cookbook
    @view = ViewCookbook.new(@cookbook)
    @scraper = nil
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

  def import
    search_term = @view.search
    @scraper = Scraper.new(search_term)
    names = @scraper.find_name
    selection = @view.list_scraped_names(names).to_i
    @scraper.find_info
    properties = @scraper.find_prep_time
    recipe = Recipe.new(names[selection-1], properties[selection-1])
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

