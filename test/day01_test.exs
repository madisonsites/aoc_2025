defmodule Day01Test do
  use ExUnit.Case

  @short_input File.read!("input/day01-short.txt")
         |> String.split("\n", trim: true)

  @long_input File.read!("input/day01-long.txt")
         |> String.split("\n", trim: true)

  test "solves part 1" do
    assert Day01.solve_part1(@short_input) == 3
    assert Day01.solve_part1(@long_input) == 1165
  end

  test "dial_points builds running totals" do
    assert Day01.dial_points([-25, 8, -44]) == [-25, -17, -61]
  end

  test "wrap_dial wraps negative positions" do
    assert Day01.wrap_dial(-1) == 99
    assert Day01.wrap_dial(-100) == 0
    assert Day01.wrap_dial(100) == 0
    assert Day01.wrap_dial(101) == 1
  end
end
