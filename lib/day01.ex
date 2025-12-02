defmodule Day01 do
  def solve(input) do
  turns =
    input
    |> Enum.map(&parse_line/1)
    |> Enum.map(&direction_to_turn/1)

  {_final_pos, zero_count} =
    Enum.reduce(turns, {50, 0}, fn turn, {pos, total} ->
      {new_pos, zeros} = count_zero_clicks(pos, turn)
      {new_pos, total + zeros}
    end)

  zero_count
  end


  def parse_line(line) do
    {dir, ticks} = String.split_at(line, 1)
    {dir, String.to_integer(ticks)}
  end

  def direction_to_turn({"L", n}), do: -n
  def direction_to_turn({"R", n}), do: n

  def dial_points(turns) do
    Enum.scan(turns, 50, fn turn, start_point ->
      stop_point = wrap_dial(start_point + turn)
      stop_point
    end)
  end

  def wrap_dial(position) do
    dial_position = rem(position, 100)

    # negative positions add 100 due to dial max of 99
    if(dial_position < 0, do: 100 + dial_position, else: dial_position)
  end

  def count_zero_clicks(start_pos, turn) do
    step = if turn >= 0, do: 1, else: -1
    steps = abs(turn)

    Enum.reduce(1..steps, {start_pos, 0}, fn _i, {pos, count} ->
      new_pos = wrap_dial(pos + step)
      new_count = if new_pos == 0, do: count + 1, else: count
      {new_pos, new_count}
    end)
  end
end
