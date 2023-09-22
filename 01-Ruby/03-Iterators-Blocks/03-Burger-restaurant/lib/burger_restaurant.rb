def burger(patty, sauce, topping)
  burgir = ["bread", patty, sauce, topping, "bread"]
  burgir[1] = yield(patty) if block_given?
  burgir
end
