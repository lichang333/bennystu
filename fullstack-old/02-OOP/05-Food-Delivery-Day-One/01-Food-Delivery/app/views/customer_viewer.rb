class CustomerViewer

  def display_customers(customer_instances_array)
    customer_instances_array.each do |customer|
      puts "#{customer.id}. #{customer.name}: #{customer.address}"
    end
  end

  def new_customer(whatever)
    puts "Please provide the #{whatever} of the new customer:"
    return gets.chomp
  end

end
