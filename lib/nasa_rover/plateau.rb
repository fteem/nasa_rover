module NASARover
  class Plateau
    attr_reader :max_x, :max_y, :rovers

    def initialize(max_position)
      @max_x = max_position.x
      @max_y = max_position.y
      @rovers = []
    end

    def add_rover(rover)
      @rovers << rover
    end
  end
end
