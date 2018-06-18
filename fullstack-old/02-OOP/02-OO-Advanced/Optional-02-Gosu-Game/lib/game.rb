
require 'gosu'
require_relative "snake.rb"
require_relative "food.rb"

class Tutorial < Gosu::Window
  def initialize
    super 640, 480 #:fullscreen => true
    self.caption = "Snake"
    @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    @snake = Snake.new
    @food = Food.new
  end

  def update
    @snake.update
  end

  def draw
    @background_image.draw(0, 0, 0)
    @snake.draw
    @food.draw
  end
end

Tutorial.new.show
