defmodule Day02 do
  def solve(input) do
    Enum.map(input, &parse_line/1)
  end

  def parse_line(line) do
    [first_id, second_id] = String.split(line, "-")
    {String.to_integer(first_id), String.to_integer(second_id)}
  end
end
