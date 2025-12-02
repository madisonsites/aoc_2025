defmodule Day01Test do
  use ExUnit.Case

  @short_input File.read!("input/day01-short.txt")
         |> String.split("\n", trim: true)

  @long_input File.read!("input/day01-long.txt")
         |> String.split("\n", trim: true)

  test "solves the puzzle" do
    assert Day01.solve(@short_input) == 6
    assert Day01.solve(@long_input) == 6496
  end

  test "parse_line parses direction and ticks" do
    assert Day01.parse_line("L68") == {"L", 68}
    assert Day01.parse_line("R5") == {"R", 5}
  end

  test "direction_to_turn converts to signed ticks" do
    assert Day01.direction_to_turn({"L", 10}) == -10
    assert Day01.direction_to_turn({"R", 10}) == 10
  end

  test "wrap_dial wraps negative positions" do
    assert Day01.wrap_dial(-1) == 99
    assert Day01.wrap_dial(-100) == 0
    assert Day01.wrap_dial(100) == 0
    assert Day01.wrap_dial(101) == 1
  end

  test "dial_points builds running totals from 50" do
    assert Day01.dial_points([-25, 8, -44]) == [25, 33, 89]
  end

  test "dial_points wraps around the dial" do
    # Start at 50, L60 ->  (50 - 60) = -10 -> 90
    # then R20 -> 110 -> 10
    assert Day01.dial_points([-60, 20]) == [90, 10]
  end

  test "count_zero_clicks with no zero crossings" do
    assert Day01.count_zero_clicks(50, 1) == {51, 0}
  end

  test "count_zero_clicks counts single zero crossing going right" do
    # 50 → ... → 0 exactly once
    assert Day01.count_zero_clicks(50, 50) == {0, 1}
  end

  test "count_zero_clicks counts multiple zero crossings (big turn)" do
    # From problem text: starting at 50, R1000 hits 0 ten times and ends back at 50
    assert Day01.count_zero_clicks(50, 1000) == {50, 10}
  end

  test "count_zero_clicks works going left" do
    # 0 is between 5 and -5 going left once
    assert Day01.count_zero_clicks(5, -10) == {95, 1}
  end

end
