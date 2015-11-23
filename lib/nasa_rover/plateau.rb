module NASARover
  class Plateau
    attr_reader :max_x, :max_y, :rovers

    def initialize(max_position)
      @max_x = max_position.x
      @max_y = max_position.y
      @rovers = []
    end

    def add_rover(rover)
      if rover.in_bounds?(@max_x, @max_y)
        @rovers << rover
      else
        raise NASARover::RoverOutOfBoundsError.new("Rover is out of plateau bounds")
      end
    end
  end
end
