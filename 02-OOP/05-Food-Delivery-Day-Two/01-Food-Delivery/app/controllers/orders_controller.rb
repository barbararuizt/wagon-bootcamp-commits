require_relative '../models/order'
require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../views/sessions_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
    @view = OrdersView.new
  end

  def add
    meal = select_meal
    customer = select_customer
    employee = select_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders(rider)
    undelivered_orders = @order_repository.my_undelivered_orders(rider)
    @view.display(undelivered_orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @view.ask_for('order id').to_i
    order = @order_repository.find(index)
    order.deliver!
    @order_repository.save
  end

  private 

  def select_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @meals_view.ask_for('meal id').to_i
    meals[index]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @customers_view.ask_for('customer id').to_i
    customers[index]
  end

  def select_employee
    employees = @employee_repository.all_riders
    @sessions_view.display(employees)
    index = @sessions_view.ask_for('employee id').to_i
    employees[index]
  end
end