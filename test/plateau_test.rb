require_relative "test_helper"

class PlateauTest < Minitest::Test
  def test_initialization_with_coordinates
    plateau = Rover::Plateau.new(5, 6)
    assert_equal 5, plateau.x
    assert_equal 6, plateau.y
  end
end
