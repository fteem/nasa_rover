require_relative 'test_helper'

class PositionTest < Minitest::Test
  def setup
    @position = Rover::Position.new(1, 2)
  end

  def test_x_coordinate
    assert_equal 1, @position.x
  end

  def test_y_coordinate
    assert_equal 2, @position.y
  end
end
