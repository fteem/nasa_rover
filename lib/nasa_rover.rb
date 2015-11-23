require "nasa_rover/version"
require "nasa_rover/position"
require "nasa_rover/plateau"
require "nasa_rover/rover"

module NASARover
  class RoverOutOfBoundsError < StandardError; end
  class InvalidDirection < StandardError; end
end
