module NASARover
  class Rover
    VALID_DIRECTIONS = %w(N E S W)

    class InvalidDirection < StandardError; end

    attr_reader :direction, :position

    def initialize(position, facing_direction)
      @direction = validate_direction!(facing_direction)
      @position  = position
    end

    def rotate_left
      direction_index = VALID_DIRECTIONS.index(@direction)
      next_direction_index = direction_index-1 < VALID_DIRECTIONS.length-1 ? direction_index - 1 : VALID_DIRECTIONS.length-1
      @direction = VALID_DIRECTIONS[next_direction_index]
    end

    def rotate_right
      direction_index = VALID_DIRECTIONS.index(@direction)
      next_direction_index = direction_index+1 > VALID_DIRECTIONS.length-1 ? 0 : direction_index + 1
      @direction = VALID_DIRECTIONS[next_direction_index]
    end

    def in_bounds?(max_x, max_y)
      (0..max_x).include?(position.x) && (0..max_y).include?(position.y)
    end

    private
    def validate_direction! direction
      raise InvalidDirection.new(direction) unless VALID_DIRECTIONS.include?(direction)
      direction
    end
  end
end
