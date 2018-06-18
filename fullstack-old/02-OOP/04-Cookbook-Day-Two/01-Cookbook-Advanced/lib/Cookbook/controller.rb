class Controller
  def initialize
    @cookbook = cookbook
    @view = ViewCookbook.new(@cookbook)
  end

  def list
  end

  def create
    recipe_name = @view.ask_name
    recipe_description = @view.ask_description
    recipe = Recipe.new(recipe_name, recipe_description)
    @cookbook.add_recipe(recipe)
    @view.listing
  end

  def import
  end

  def destroy
  end

  def mark_as_done
  end

end
