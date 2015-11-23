require_relative "test_helper"

class NavigatorTest < Minitest::Test

  def setup
    @rover   = NASARover::Rover.new(NASARover::Position.new(5,5), 'W')
    @plateau = NASARover::Plateau.new(NASARover::Position.new(10,10))
    @navigator = NASARover::Navigator.new(@rover, @plateau)
  end

  def test_navigate_turns_rover_left
    @navigator.navigate("L")
    assert_equal "S", @rover.direction
  end

  def test_navigate_turns_rover_right
    @navigator.navigate("R")
    assert_equal "N", @rover.direction
  end

  def test_navigate_moves_rover
    @navigator.navigate("M")
    assert_equal 4, @rover.position.x
    assert_equal 5, @rover.position.y
  end
end
