class Car
  require_relative './coords'
  attr_accessor :current_position # coords
  attr_accessor :previous_position # coords
  # top left of the map is 0,0
  # bottom right is max x, max y
  # car can go off the map btw

  def x_delta
    (current_position.x - previous_position.x).abs
  end

  def y_delta
    (current_position.y - previous_position.y).abs
  end

  def speed
    [x_delta, y_delta].max
  end

  def starting_moves quick_start
    # normal start is speed 1
    # quick start is speed 2
  end

  def available_moves
    # assuming speed is > 1 then available moves are +/-2 from vector endpoint
    coords = []
    if speed > 1
      next_pos = next_position
      (-2..2).each do |x|
        (-2..2).each do |y|
          new_x = next_pos.x + x
          new_y = next_pos.y + y
          coords << Coords.new(new_x, new_y)
        end
      end
    else
      # if speed <= 1 then coords are +0..1 in direction of travel
      #                           and -1..1 in prependicular of direction of travel
    end
    coords
  end

  def next_position
    x = if current_position.x > previous_position.x
          current_position.x + x_delta
        else
          current_position.x - x_delta
        end
    y = if current_position.y > previous_position.y
          current_position.y + y_delta
        else
          current_position.y - y_delta
        end
    Coords.new x, y
  end
end
