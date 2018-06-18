class Employee
  attr_accessor :id, :username
  attr_reader :password, :role
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    if @role == "manager"
      return true
    else
      return false
    end
  end

  def delivery_guy?
    if @role == "delivery_guy"
      return true
    else
      return false
    end
  end
end
