
class Meal
  attr_accessor :id, :name, :price
  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id].to_i
  end
end

