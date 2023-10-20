class OrdersView
  def ask_for(thing)
    puts "Please enter your #{thing}"
    print "> "
    gets.chomp.to_i
  end

  def display(orders)
    # p orders[1]
    orders.each_with_index do |order, index|
      puts "Order ##{index + 1} - #{order.meal.name} - For #{order.customer.name} - Delivered by #{order.employee.username}"
    end
  end
end