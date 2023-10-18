# TODO: implement the router of your app.
class Router
  def initialize(meals_c, customer_c)
    @meals_controller = meals_c
    @customer_controller = customer_c
    @running = true
  end

  def run
    puts "Welcome to the Food Delivery!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.destroy
    when 4 then @customer_controller.list
    when 5 then @customer_controller.add
    when 6 then @customer_controller.destroy
    when 7 then stop
    else
      puts "Please press 1-7"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List meals"
    puts "2 - Add a meal"
    puts "3 - Destroy a meal"
    puts "4 - List customers"
    puts "5 - Add a customer"
    puts "6 - Destroy a customer"
    puts "7 - Stop and exit the program"
  end
end
