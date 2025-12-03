defmodule Day02 do
  def solve(input) do
    output =input
    |> Enum.map(&parse_line/1)
    |> Enum.flat_map(&output_range/1)
    |> Enum.filter(&invalid_sku?/1)
    |> Enum.sum()

    # IO.inspect(output, label: "output")
    output
  end

  def parse_line(line) do
    IO.inspect(line, label: "parse_line_input")
    [first_id, second_id] = String.split(line, "-")
    output = {String.to_integer(first_id), String.to_integer(second_id)}
    IO.inspect(output, label: "parse_line_output")
    output
  end

  def output_range({start_id, end_id}) do
    IO.inspect({start_id, end_id}, label: "output_range_input")
    output = Enum.to_list(start_id..end_id)
    IO.inspect(output, label: "output_range_output", as: :list)
    output
  end

  def invalid_sku?(sku) do
    sku_string = Integer.to_string(sku)
    sku_length = String.length(sku_string)
    even_length = rem(sku_length, 2) == 0

    if even_length do
      halfway_point = (sku_length / 2) |> floor()
      IO.inspect(sku_string, label: "sku_string")
      IO.inspect(halfway_point, label: "halfway_point")
      {first_half, second_half} = String.split_at(sku_string, halfway_point)
      IO.inspect(first_half, label: "first_half")
      IO.inspect(second_half, label: "second_half")
      first_half == second_half
    else
      false
    end
  end
end
