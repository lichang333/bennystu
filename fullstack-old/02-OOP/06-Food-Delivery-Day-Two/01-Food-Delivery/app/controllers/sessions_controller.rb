require_relative '../repositories/employee_repository.rb'
require_relative '../models/employee.rb'
require_relative '../views/view.rb'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = View.new
  end

  def sign_in
    username = @view.ask_for_username
    password = @view.ask_for_password
    employee = @employee_repository.find_by_username(username)
    if username == employee && password == employee.password
      return "Welcome #{username}"
    else
      return "Invalid credentials"
    end
  end
end
