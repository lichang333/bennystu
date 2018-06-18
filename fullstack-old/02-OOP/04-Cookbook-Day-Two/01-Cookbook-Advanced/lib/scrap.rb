class Recipe
  attr_reader :name, :description
  def initialize(names, description)
    @name = names
    @description = description
  end
end

###

game = Recipe.new("test", "testing")
p game.name
