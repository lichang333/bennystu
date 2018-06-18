
require_relative '../models/customer'
require 'csv'

class CustomerRepository
  def initialize(csv_path)
    @customers = []
    @csv_path = csv_path
    @csv_options = { headers: :first_row, header_converters: :symbol }
    read_from_csv if File.exist?(@csv_path)
  end

  def read_from_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = set_id
    @customers << customer
    save_to_csv
  end

  def find(id)
    @customers.each do |customer|
      return customer if customer.id.to_i == id.to_i
    end
  end

  private

  def save_to_csv
    CSV.open(@csv_path, 'wb', @csv_options) do |csv|
      csv << ["id","name","address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def set_id
    @customers.last == nil ? 1 : @customers.last.id + 1
  end
end
