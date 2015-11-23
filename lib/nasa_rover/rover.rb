module NASARover
  class Rover
    VALID_DIRECTIONS = %w(N E S W)

    attr_reader :direction, :position

    def initialize(position, facing_direction)
      @direction = validate_direction!(facing_direction)
      @position  = position
    end

    def rotate_left
      direction_index = VALID_DIRECTIONS.index(@direction)
      next_direction_index = if direction_index-1 < VALID_DIRECTIONS.length-1
                               direction_index - 1
                             else
                               VALID_DIRECTIONS.length-1
                             end
      @direction = VALID_DIRECTIONS[next_direction_index]
    end

    def rotate_right
      direction_index = VALID_DIRECTIONS.index(@direction)
      next_direction_index = if direction_index+1 > VALID_DIRECTIONS.length-1
                               0
                             else
                               direction_index + 1
                             end
      @direction = VALID_DIRECTIONS[next_direction_index]
    end

    def in_bounds?(max_x, max_y)
      (1..max_x).include?(position.x) && (1..max_y).include?(position.y)
    end

    def move
      case @direction
      when "N"
        @position.north
      when "E"
        @position.east
      when "S"
        @position.south
      when "W"
        @position.west
      end
    end

    def report_position
      "#{position.x} #{position.y} #{direction}"
    end

    private
    def validate_direction! direction
      raise NASARover::InvalidDirectionError.new(direction) unless VALID_DIRECTIONS.include?(direction)
      direction
    end
  end
end
