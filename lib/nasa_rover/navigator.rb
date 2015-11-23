require 'forwardable'

module NASARover
  class Navigator

    extend Forwardable
    def_delegators :@rover, :report_position

    def initialize rover, plateau
      @rover = rover
      @plateau = plateau
    end

    def navigate command
      case command
      when "L"
        @rover.rotate_left
      when "R"
        @rover.rotate_right
      when "M"
        if can_move?
          @rover.move
        else
          raise NASARover::InvalidMoveError.new("Cannot move there. Rover position: #{report_position}")
        end
      end
    end

    private
    def can_move?
      @rover.in_bounds?(@plateau.max_x, @plateau.max_y)
    end

  end
end
