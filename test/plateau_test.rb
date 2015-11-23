require_relative "test_helper"

class PlateauTest < Minitest::Test
  def setup
    max_position = NASARover::Position.new(5, 6)
    @plateau = NASARover::Plateau.new(max_position)
  end

  def test_max_x
    assert_equal 5, @plateau.max_x
  end

  def test_max_y
    assert_equal 6, @plateau.max_y
  end

  def test_add_rover_in_boundaries
    position = NASARover::Position.new(2,2)
    rover = NASARover::Rover.new(position, "E")
    @plateau.add_rover(rover)
    assert rover, @plateau.rovers.first
  end

  def test_add_rover_out_of_boundaries
    position = NASARover::Position.new(6,6)
    rover = NASARover::Rover.new(position, "E")
    assert_raises NASARover::RoverOutOfBoundsError do
      @plateau.add_rover(rover)
    end
  end
end
