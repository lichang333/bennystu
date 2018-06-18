class OrderViewer

  def display_orders(array_of_orders)
    array_of_orders.each do |order|
      puts "#{order.customer.name}, #{order.meal.name}, #{order.employee.username}, #{order.customer.address}"
    end
  end

  def new_order(whatever)
    puts "Please provide the #{whatever} of the new order:"
    return gets.chomp
  end

  def order_is_delivered
    puts "Please provide the Order ID of the new order:"
    gets.chomp.to_i
  end
end
