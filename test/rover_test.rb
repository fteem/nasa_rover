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
    assert_raises NASARover::InvalidDirection do
      NASARover::Rover.new(position, 'H')
    end
  end

  def test_rotating_left
    position = NASARover::Position.new(1,1)
    rover = NASARover::Rover.new(position, 'E')
    rover.rotate_left
    assert_equal "N", rover.direction
  end

  def test_rotating_right
    position = NASARover::Position.new(1,1)
    rover = NASARover::Rover.new(position, 'W')
    rover.rotate_right
    assert_equal "N", rover.direction
  end

  def test_multiple_rotation_right
    position = NASARover::Position.new(1,1)
    rover = NASARover::Rover.new(position, 'W')
    rover.rotate_right
    rover.rotate_right
    rover.rotate_right
    assert_equal "S", rover.direction
  end

  def test_multiple_rotation_left
    position = NASARover::Position.new(1,1)
    rover = NASARover::Rover.new(position, 'W')
    rover.rotate_left
    rover.rotate_left
    rover.rotate_left
    assert_equal "N", rover.direction
  end

  def test_in_bounds_when_inside_boundaries
    position = NASARover::Position.new(1,1)
    rover = NASARover::Rover.new(position, 'W')
    assert rover.in_bounds?(2, 2)
  end

  def test_in_bounds_when_outside_boundaries
    position = NASARover::Position.new(3,3)
    rover = NASARover::Rover.new(position, 'W')
    refute rover.in_bounds?(2, 2)
  end

  def test_moving_once_west
    position = NASARover::Position.new(3,3)
    rover = NASARover::Rover.new(position, 'W')
    rover.move
    assert_equal 2, rover.position.x
    assert_equal 3, rover.position.y
  end

  def test_moving_once_east
    position = NASARover::Position.new(3,3)
    rover = NASARover::Rover.new(position, 'E')
    rover.move
    assert_equal 4, rover.position.x
    assert_equal 3, rover.position.y
  end

  def test_moving_once_north
    position = NASARover::Position.new(3,3)
    rover = NASARover::Rover.new(position, 'N')
    rover.move
    assert_equal 3, rover.position.x
    assert_equal 4, rover.position.y
  end

  def test_moving_once_south
    position = NASARover::Position.new(3,3)
    rover = NASARover::Rover.new(position, 'S')
    rover.move
    assert_equal 3, rover.position.x
    assert_equal 2, rover.position.y
  end
end
