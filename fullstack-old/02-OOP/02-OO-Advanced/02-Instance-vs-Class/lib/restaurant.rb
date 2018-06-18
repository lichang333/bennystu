class Restaurant
  # TODO: add relevant accessors if necessary
  attr_accessor :average_rating, :city
  def initialize(city, name)
    @city = city
    @name = name
    @ratings = []
    @average_rating = 0
  end

  def rate(new_rate)
    @ratings << new_rate
    @average_rating = @ratings.sum / @ratings.size
  end

  def self.filter_by_city(restaurants, city)
    restaurants.select { |c| c.city == city }
  end
end


