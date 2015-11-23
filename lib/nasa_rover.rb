require "nasa_rover/version"
require "nasa_rover/position"
require "nasa_rover/plateau"
require "nasa_rover/rover"
require "nasa_rover/navigator"
require "nasa_rover/cli"

module NASARover
  class RoverOutOfBoundsError < StandardError; end
  class InvalidDirectionError < StandardError; end
  class InvalidMoveError < StandardError; end

  def start
    NASARover::CLI.start
  end
end
