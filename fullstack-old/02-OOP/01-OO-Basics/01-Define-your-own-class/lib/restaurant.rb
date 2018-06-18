class Restaurant
  def initialize(cuisine, price, value)
    @mcuisine = cuisine
    @price = price
    @value = value
    @cleanliness = 5
  end

  def clean
    @cleanliness += 2 unless @cleanliness >= 10
  end
end
