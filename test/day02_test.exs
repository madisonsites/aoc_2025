defmodule Day02Test do
  use ExUnit.Case

  # @short_input File.read!("input/day02-short.txt")
  #        |> String.split("\n", trim: true)

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

  test "output_range outputs the range" do
    assert Day02.output_range({11, 22}) == [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
    assert Day02.output_range({95, 115}) == [95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115]
    assert Day02.output_range({998, 1012}) == [998, 999, 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012]
    assert Day02.output_range({1188511880, 1188511890}) == [1188511880, 1188511881, 1188511882, 1188511883, 1188511884, 1188511885, 1188511886, 1188511887, 1188511888, 1188511889, 1188511890]
    assert Day02.output_range({222220, 222224}) == [222220, 222221, 222222, 222223, 222224]
    assert Day02.output_range({1698522, 1698528}) == [1698522, 1698523, 1698524, 1698525, 1698526, 1698527, 1698528]
    assert Day02.output_range({446443, 446449}) == [446443, 446444, 446445, 446446, 446447, 446448, 446449]
    assert Day02.output_range({38593856, 38593862}) == [38593856, 38593857, 38593858, 38593859, 38593860, 38593861, 38593862]
  end

  test "even_length? returns true for even-length SKUs" do
    ["11", "22", "95", "1012", "1188511880", "1188511890", "222220", "222224", "446443", "446449", "38593856", "38593862"]
    |> Enum.each(fn sku ->
      assert Day02.even_length?(sku) == true
    end)
  end

  test "even_length? returns false for odd-length SKUs" do
    ["111", "222", "955", "10122", "11885118800", "11885118900", "2222200", "2222244", "4464433", "4464499", "385938566", "385938622"]
    |> Enum.each(fn sku ->
      assert Day02.even_length?(sku) == false
    end)
  end
end
