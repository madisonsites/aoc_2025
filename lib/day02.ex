defmodule Day02 do
  def solve(input) do
    output =input
    |> Enum.map(&parse_line/1)
    |> Stream.flat_map(fn {start_id, end_id} ->
      start_id..end_id
    end)
    |> Stream.filter(&invalid_sku?/1)
    |> Enum.sum()

    IO.inspect(output, label: "output")
    output
  end

  def parse_line(line) do
    # IO.inspect(line, label: "parse_line_input")
    [first_id, second_id] = String.split(line, "-")
    output = {String.to_integer(first_id), String.to_integer(second_id)}
    # IO.inspect(output, label: "parse_line_output")
    output
  end

  def invalid_sku?(sku) do
    sku_string = Integer.to_string(sku)
    sku_length = String.length(sku_string)

    if sku_length < 2 do
      false
    else
      pattern_length = div(sku_length, 2)
      Enum.any?(1..pattern_length, fn pattern_spot ->
        repetition_count = div(sku_length, pattern_spot)

        if rem(sku_length, pattern_spot) != 0 do
          false
        else

          pattern = String.slice(sku_string, 0, pattern_spot)
          String.duplicate(pattern, repetition_count) == sku_string
        end
      end)
    end
  end
end
