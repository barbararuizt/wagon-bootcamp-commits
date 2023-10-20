require_relative '../models/order'
require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def add
    meal_id = @view.ask_for('meal_id').to_i - 1
    meal = @meal_repository.find(meal_id)

    customer_id = @view.ask_for('customer_id').to_i - 1
    customer = @customer_repository.find(customer_id)

    employee_id = @view.ask_for('employee_id').to_i - 1
    employee = @employee_repository.find(employee_id)

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders(employee)
    undelivered = @order_repository.undelivered_orders.select { |order| order.employee == employee }
    @view.display(undelivered)
  end

  def list_my_orders(employee)
    my_orders = @order_repository.undelivered_orders.select { |order| order.employee == employee }
    @view.display(my_orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @view.ask_for('order id').to_i
    order = @order_repository.find(index)
    order.deliver!
    p order # checking
    @order_repository.save
  end
end