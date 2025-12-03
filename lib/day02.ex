defmodule Day02 do
  def solve(input) do
    input
    |> Enum.map(&parse_line/1)
    |> Enum.flat_map(&output_range/1)
  end

  def parse_line(line) do
    [first_id, second_id] = String.split(line, "-")
    {String.to_integer(first_id), String.to_integer(second_id)}
  end

  def output_range({start_id, end_id}) do
    Enum.to_list(start_id..end_id)
  end

  def invalid_sku?(sku) do
    sku_string = Integer.to_string(sku)

    if even_length?(sku_string) do
      true
    else
      false
    end
  end

  def even_length?(sku_string) do
    sku_length = String.length(sku_string)
    even_length = rem(sku_length, 2) == 0

    even_length
  end
end
