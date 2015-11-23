module NASARover
  class Position
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def east
      @x += 1
    end

    def west
      @x -= 1
    end

    def north
      @y += 1
    end

    def south
      @y -= 1
    end
  end
end
