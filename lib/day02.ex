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
end
