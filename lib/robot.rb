class Robot
  attr_accessor :pos_x, :pos_y, :direction

  def initialize(x,y,direction)
    set(x,y,direction)
  end

  def set(x,y,direction=@direction)
    @pos_x = x
    @pos_y = y
    @direction = direction
  end

  def turn_left
    @direction = direction_turning(@direction, -1)
  end

  def turn_right
    @direction = direction_turning(@direction, 1)
  end

  def report
    "#{@pos_x},#{@pos_y},#{@direction}"
  end

  private
    def direction_turning(direction_from, operator)
      direction_to_num = {'NORTH' => 0, 'EAST' => 1, 'SOUTH' => 2, 'WEST' =>3}
      num_to_direction = direction_to_num.invert
      num_to_direction[(direction_to_num[direction_from] + operator)%4]
    end
end


