class SessionsView
  def ask_for(thing)
    puts "Please enter your #{thing}"
    print "> "
    gets.chomp
  end

  def welcome(employee)
    puts "Welcome #{employee.username}!"
  end

  def wrong_credentials
    puts "Wrong credentials... Try again!"
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1} - #{employee.username} - #{employee.role}"
    end
  end
end
