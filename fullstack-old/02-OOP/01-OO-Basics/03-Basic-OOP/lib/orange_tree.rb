class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :age, :height, :dead, :fruits
  def initialize
    @height = 0
    @dead = false
    @age = 0
    @fruits = 0
    @prob_of_dying = 0
  end

  def one_year_passes!
    # TODO: age the tree by one year
    @age += 1
    # TODO: fruit falls off
    @fruits = 0
    # TODO: check if the tree has survived
    return if @dead == true
    # TODO: if so, make the tree height grow
    @height += 1 if @age < 11
    # TODO: if so, make the tree grow fruits
    @fruits = 200 if @age > 9 && @age < 15
    @fruits = 100 if @age > 5 && @age < 10
  end

  def dead?
    @prob_of_dying += 1 if @age > 50
    @dead = true if @age > 99
    @dead = true if rand(@prob_of_dying..49) > 48 && @prob_of_dying > 0
    @dead
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits > 0
  end
end
