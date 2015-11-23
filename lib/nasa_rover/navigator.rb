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
        @rover.move
      end
    end
  end
end
