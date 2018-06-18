require_relative '../models/employee'
require 'csv'

class EmployeeRepository
  def initialize(csv_path)
    @employees = []
    @csv_path = csv_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    read_csv if File.exist?(@csv_path)
  end

  def read_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end

  def all_delivery_guys
    delivery_guys = @employees.select { |employee| employee.role == "delivery_guy" }
  end

  def find(banana)
    @employees.each do |employee|
      return employee if employee.id == banana.to_i
    end
  end

  def find_by_username(username)
    @employees.each do |employee|
      return employee if employee.username == username
    end
  end
end
