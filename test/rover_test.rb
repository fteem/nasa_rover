require_relative 'test_helper'

class RoverTest < Minitest::Test
  def test_starting_position_x_coordiante
    position = NASARover::Position.new(5, 6)
    rover = NASARover::Rover.new(position, 'N')
    assert_equal 5, rover.position.x
  end

  def test_starting_position_y_coordiante
    position = NASARover::Position.new(5, 6)
    rover = NASARover::Rover.new(position, 'N')
    assert_equal 6, rover.position.y
  end

  def test_facing_direction
    position = NASARover::Position.new(5, 6)
    rover = NASARover::Rover.new(position, 'N')
    assert_equal "N", rover.direction
  end

  def test_direction_validation_when_invalid_direction
    position = NASARover::Position.new(5, 6)
    assert_raises NASARover::Rover::InvalidDirection do
      NASARover::Rover.new(position, 'H')
    end
  end
end
