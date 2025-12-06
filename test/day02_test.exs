defmodule Day02Test do
  use ExUnit.Case

  @short_input File.read!("input/day02-short.txt")
         |> String.trim()
         |> String.split(",", trim: true)

  @long_input File.read!("input/day02-long.txt")
         |> String.trim()
         |> String.split(",", trim: true)

  test "solves the puzzle" do
    assert Day02.solve(@short_input) == 1227775554
    assert Day02.solve(@long_input) == 26255179562
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

  test "invalid_sku? returns true for repeated digit SKUs" do
    [11, 22, 99, 1010, 1188511885, 222222, 446446, 38593859]
    |> Enum.each(fn sku ->
      assert Day02.invalid_sku?(sku) == true
    end)
  end

  test "invalid_sku? returns false for non-repeated digit SKUs" do
    [95, 1012, 1188511880, 1188511890, 222220, 222224, 446443, 446449, 38593856, 38593862]
    |> Enum.each(fn sku ->
      assert Day02.invalid_sku?(sku) == false
    end)
  end

  test "invalid_sku? returns false for odd-length SKUs" do
    [111, 222, 955, 10122, 11885118800, 11885118900, 2222200, 2222244, 4464433, 4464499, 385938566, 385938622]
    |> Enum.each(fn sku ->
      assert Day02.invalid_sku?(sku) == false
    end)
  end
end
