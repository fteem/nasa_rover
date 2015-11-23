module NASARover
  class Plateau
    attr_reader :max_x, :max_y

    def initialize(max_position)
      @max_x = max_position.x
      @max_y = max_position.y
    end
  end
end
