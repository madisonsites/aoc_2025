defmodule Day02Test do
  use ExUnit.Case

  @short_input File.read!("input/day02-short.txt")
         |> String.split("\n", trim: true)

  # @long_input File.read!("input/day02-long.txt")
  #        |> String.split("\n", trim: true)

  test "solves the puzzle" do
    # assert Day02.solve(@short_input) == 6
  end

  test "parse_line parses the input" do
    assert Day02.parse_line("11-22") == {11, 22}
    assert Day02.parse_line("95-115") == {95, 115}
    assert Day02.parse_line("998-1012") == {998, 1012}
    assert Day02.parse_line("1188511880-1188511890") == {1188511880, 1188511890}
    assert Day02.parse_line("222220-222224") == {222220, 222224}
    assert Day02.parse_line("1698522-1698528") == {1698522, 1698528}
    assert Day02.parse_line("446443-446449") == {446443, 446449}
    assert Day02.parse_line("38593856-38593862") == {38593856, 38593862}
  end
end
