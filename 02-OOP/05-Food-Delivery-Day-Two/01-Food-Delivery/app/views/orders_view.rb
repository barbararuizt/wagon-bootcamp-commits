class OrdersView
  def ask_for(thing)
    puts "Please enter your #{thing}"
    print "> "
    gets.chomp.to_i
  end

  def display(orders)
    # p orders[1]
    orders.each_with_index do |order, index|
      meal = order.meal.name
      customer = order.customer.name
      employee = order.employee.username
      puts "Order ##{index + 1} - #{meal} - For #{customer} - Delivered by #{employee}"
    end
  end
end
