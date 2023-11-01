require_relative 'meal_repository'
require_relative 'customer_repository'
require_relative 'employee_repository'
require 'csv'
require 'pry-byebug'

class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @elements = []
    @next_id = 1

    load_csv if File.exist?(@csv_file)
  end

  def create(item)
    item.id = @next_id
    @elements << item
    @next_id += 1
    save_csv
  end

  def undelivered_orders
    @elements.reject { |order| order.delivered? }
  end

  def my_undelivered_orders(employee)
    undelivered_orders.select { |order| order.employee == employee }
  end

  def find(id)
    @elements.find { |order| order.id == id }
  end

  def save
    save_csv
  end

  def deliver_order(order)
    order.deliver!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id]    = row[:id].to_i
      row[:meal]  = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:delivered] = row[:delivered] == 'true'
      @elements << Order.new(row)
    end
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']
      @elements.each do |order|
        # binding.pry
        csv << [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
