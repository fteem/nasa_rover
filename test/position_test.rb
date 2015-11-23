require_relative 'test_helper'

class PositionTest < Minitest::Test
  def test_x_coordinate
    position = Rover::Position.new(1, 2)
    assert_equal 1, position.x
  end

  def test_y_coordinate
    position = Rover::Position.new(1, 2)
    assert_equal 2, position.y
  end

  def test_move_north
    position = Rover::Position.new(1, 2)
    position.north
    assert_equal 1, position.x
    assert_equal 3, position.y
  end

  def test_move_south
    position = Rover::Position.new(1, 2)
    position.south
    assert_equal 1, position.x
    assert_equal 1, position.y
  end

  def test_move_east
    position = Rover::Position.new(1, 2)
    position.east
    assert_equal 2, position.x
    assert_equal 2, position.y
  end

  def test_move_west
    position = Rover::Position.new(1, 2)
    position.west
    assert_equal 0, position.x
    assert_equal 2, position.y
  end
end
