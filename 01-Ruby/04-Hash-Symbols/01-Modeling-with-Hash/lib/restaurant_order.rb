def poor_calories_counter(burger, side, beverage)
  menu = {
    'Hamburger' => 250, 'Cheese Burger'	=> 300, 'Veggie Burger'	=> 540, 'Vegan Burger'	=> 350,
    'Sweet Potatoes'	=> 230, 'Salad'	=> 15, 'Iced Tea'	=> 70, 'Lemonade'	=> 90
  }
  menu[burger] + menu[side] + menu[beverage]
  # TODO: return number of calories for this restaurant order
end
