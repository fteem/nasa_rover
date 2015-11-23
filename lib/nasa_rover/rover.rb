module NASARover
  class Rover

    class InvalidDirection < StandardError; end

    attr_reader :direction, :position

    def initialize(position, facing_direction)
      @direction = validate_direction!(facing_direction)
      @position  = position
    end

    private
    def validate_direction! direction
      raise InvalidDirection.new(direction) unless %q(N S W E).include?(direction)
      direction
    end
  end
end
