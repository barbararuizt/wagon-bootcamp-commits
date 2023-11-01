require_relative "../models/employee"
require_relative "../views/sessions_view"

class SessionsController
  def initialize(repo)
    @repo = repo
    @view = SessionsView.new
  end

  def login
    username = @view.ask_for('username')
    password = @view.ask_for('password')
    employee = @repo.find_by_username(username)
    if employee && employee.password == password
      @view.welcome(employee)
      return employee
    else
      @view.wrong_credentials
      login
    end
  end
end
