require_relative "../models/customer"
require_relative "../views/customers_view"

class CustomersController
  def initialize(repo)
    @repo = repo
    @view = CustomersView.new
  end

  def add
    name = @view.ask_for('name')
    address = @view.ask_for('address')
    customer = Customer.new(name: name, address: address)
    @repo.create(customer)
  end

  def list
    customers = @repo.all
    @view.display(customers)
  end
end
