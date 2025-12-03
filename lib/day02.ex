defmodule Day02 do
  def solve(input) do
    input
    |> Enum.map(&parse_line/1)
    |> Enum.flat_map(&output_range/1)
    |> Enum.filter(&invalid_sku?/1)
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
    sku_length = String.length(sku_string)
    even_length = rem(sku_length, 2) == 0

    if even_length do
      halfway_point = (sku_length / 2) |> floor()
      IO.inspect(sku_string, label: "sku_string")

      {first_half, second_half} = String.split_at(sku_string, halfway_point)
      first_half == second_half
    else
      false
    end
  end
end
