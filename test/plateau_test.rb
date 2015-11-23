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

end
