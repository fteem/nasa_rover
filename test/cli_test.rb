require_relative 'test_helper'


class CLITest < Minitest::Test

  def setup
    @input = %Q(
      5 5

      1 2 N

      LMLMLMLMM

      3 3 E

      MMRMMRMRRM
    )
  end

  def test_parses_input
    plateau_bounds, 
    first_rover_location, 
    first_rover_movement, 
    second_rover_location, 
    second_rover_movement = CLI.parse_input(@input)

    assert_equal plateau_bounds, [5, 5]
    assert_equal first_rover_location, [1, 2, "N"]
    assert_equal first_rover_movement, %w(L M L M L M L M M)
    assert_equal second_rover_location, [3, 3, "E"]
    assert_equal second_rover_movement, %w(M M R M M R M R R M)
  end
end

