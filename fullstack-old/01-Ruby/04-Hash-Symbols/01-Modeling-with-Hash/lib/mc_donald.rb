BURGERS = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350
}

SIDES = {
  "French Fries" => 230,
  "Salad" => 15
}

BEVERAGES = {
  "Coca Cola" => 150,
  "Sprite" => 150
}

def poor_calories_counter(burger, side, beverage)
  # TODO: return number of calories for this mcDonald order

  calories =  BURGERS[burger].nil? ? 0 : BURGERS[burger]
  calories += SIDES[side].nil? ? 0 : SIDES[side]
  calories += BEVERAGES[beverage].nil? ? 0 : BEVERAGES[beverage]

  return calories
end

poor_calories_counter("Hamburger", "French Fries", "Coca Cola")
