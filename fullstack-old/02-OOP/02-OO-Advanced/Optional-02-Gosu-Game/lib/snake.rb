
require 'gosu'

class Snake < Gosu::Window

  def initialize
    @x, @y = 10, 10
    @dir_x = 1
    @dir_y = 0
  end

  def update
    @x += @dir_x
    @y += @dir_y
    get_inputs
    # left

  end

  def draw
    Gosu::draw_rect(@x, @y, 20, 20, Gosu::Color.argb(0xff_ffffff))
  end

  def get_inputs
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @dir_y = 0
      @dir_x = -1
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @dir_y = 0
      @dir_x = 1
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @dir_x = 0
      @dir_y = -1
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @dir_x = 0
      @dir_y = 1
    end
  end
end



# Let's do some modelling on the Snake.
# What should be its state? What about its behavior?
# You may need Gosu::draw_rect and Gosu::Color::WHITE.
