class Router
  def initialize(sessions_controller, meals_controller, customers_controller, orders_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @orders_controller = orders_controller
    @running = true
  end

  def login
    puts "Welcome to this restaurant!"
    puts "           --           "
    puts "press any key"
    login_answer = gets.chomp
    route_action_login(login_answer)
  end

  def run
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action_run(action)
    end
  end

  private
  # una route action per manager e una per delivery guy

  def route_action_login(login_answer)
    @sessions_controller.sign_in
  end

  def route_action_run(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4, 5 or 6"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Check our menu"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "6 - Stop and exit the program"
    print "> "
  end
end

