DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Veggie Burger" => 540,
  "Vegan Burger" => 350,
  "Sweet Potatoes" => 230,
  "Salad" => 15,
  "Iced Tea" => 70,
  "Lemonade" => 90
}

COMBOS = {
  "Cheesy Combo" => ["Cheese Burger", "Sweet Potatoes", "Lemonade"],
  "Veggie Combo" => ["Veggie Burger", "Sweet Potatoes", "Iced Tea"],
  "Vegan Combo" => ["Vegan Burger", "Salad", "Lemonade"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  x = 0
  orders.each do |meal|
    if COMBOS.key?(meal)
      x += poor_calories_counter(COMBOS[meal][0], COMBOS[meal][1], COMBOS[meal][2]) # siempre 3
      # COMBOS[meal].each { |dish| x += DISHES_CALORIES[dish] } - más flexible pero más lento
    else
      x += DISHES_CALORIES[meal].to_i
    end
  end
  x
  # TODO: return number of calories for a less constrained order
end
