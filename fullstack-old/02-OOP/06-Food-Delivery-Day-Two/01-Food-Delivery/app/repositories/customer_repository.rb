require 'csv'
require_relative '../models/customer.rb'

class CustomerRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @customers = []
    load_csv
  end

  def load_csv
    if File.exist?(@csv_filepath)
        csv_options = { headers: :first_row, header_converters: :symbol }
        CSV.foreach(@csv_filepath, csv_options) do |row|
        row[:id] = row[:id].to_i
        @customers << Customer.new(row)
        end
    end
      @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def save_to_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_filepath, 'wb') do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_to_csv
  end

  def find(id)
    @customers.find { |customer| customer.id == id}
  end
end
