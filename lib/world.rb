require_relative 'robot'

class World
  attr_reader :width, :height
  attr_accessor :robot

  def initialize
    @width = 5
    @height = 5
  end

  def place(x,y, direction)
    if within_table?(x,y)
      @robot ? @robot.set(x,y,direction) : (@robot = Robot.new(x,y,direction))
    end
  end

  def robot_navigate
    new_x = @robot.pos_x
    new_y = @robot.pos_y

    case @robot.direction
    when 'SOUTH'
      new_y -= 1
    when 'NORTH'
      new_y += 1
    when 'EAST'
      new_x += 1
    when 'WEST'
      new_x -= 1
    end

    @robot.set(new_x,new_y) if within_table?(new_x, new_y)

  end

  private
    def within_table?(x,y)
      x >= 0 && x < @width && y >= 0 && y <= @height
    end
end



