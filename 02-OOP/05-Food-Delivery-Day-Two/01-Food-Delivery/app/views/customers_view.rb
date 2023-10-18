class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(stuff)
    puts "What's the #{stuff}?"
    print '> '
    gets.chomp
  end
end
