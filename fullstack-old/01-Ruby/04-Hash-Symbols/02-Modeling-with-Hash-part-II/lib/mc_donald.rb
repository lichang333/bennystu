DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

MEALS = {
  "Happy Meal" => ["Cheese Burger", "French Fries", "Coca Cola"],
  "Best Of Big Mac" => ["Big Mac", "French Fries", "Coca Cola"],
  "Best Of McChicken" => ["McChicken", "Salad", "Sprite"]
}





def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  calories = 0
  orders.each do |order|
    if MEALS.key? order
      # calories += poor_calories_counter(MEALS[order]
      calories += poor_calories_counter(MEALS[order][0], MEALS[order][1], MEALS[order][2])
    else
      DISHES_CALORIES.key? order ? calories += DISHES_CALORIES[order] : "no such dish"
    end
  end
  return calories
end

order = ["French Fries", "Happy Meal", "Sprite", "Best Of McChicken"]
puts calories_counter(order)
