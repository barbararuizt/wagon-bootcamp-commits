# TODO: implement the router of your app.
class Router
  def initialize(controller)
    @controller = controller
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
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then stop
    else
      puts "Please press 1, 2 or 3"
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
    puts "3 - Stop and exit the program"
  end
end
