module NASARover
  class Rover

    class InvalidDirection < StandardError; end

    attr_reader :direction, :position

    def initialize(position, facing_direction)
      @direction = validate_direction!(facing_direction)
      @position  = position
    end

    def rotate_left
      case @direction
      when "N"
        @direction = "W"
      when "E"
        @direction = "N"
      when "S"
        @direction = "E"
      when "W"
        @direction = "S"
      end
    end

    def rotate_right
      case @direction
      when "N"
        @direction = "E"
      when "E"
        @direction = "S"
      when "S"
        @direction = "W"
      when "W"
        @direction = "N"
      end
    end

    private
    def validate_direction! direction
      raise InvalidDirection.new(direction) unless %q(N S W E).include?(direction)
      direction
    end
  end
end
