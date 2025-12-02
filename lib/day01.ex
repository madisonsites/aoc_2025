defmodule Day01 do
  def solve_part1(input) do
    instructions = Enum.map(input, fn line ->
      { direction, ticks} = String.split_at(line, 1)
      {direction, String.to_integer(ticks)}
    end)

    turns = Enum.map(instructions, fn
      {"L", ticks} -> -ticks
      {"R", ticks} -> ticks
    end)
    IO.inspect(turns, label: "turns")

    stops = dial_points(turns)
    IO.inspect(stops, label: "stops")
    Enum.count(stops, fn point -> point == 0 end)
  end

  def dial_points(turns) do
    Enum.scan(turns, 50, fn start_point, turn ->
      stop_point = wrap_dial(start_point + turn)
      # IO.inspect(start_point, label: "start_point")
      # IO.inspect(turn, label: "turn")
      # IO.inspect(stop_point, label: "stop_point")
      stop_point
    end)
  end

  def wrap_dial(position) do
    dial_position = rem(position, 100)

    # negative positions add 100 due to dial max of 99
    if(dial_position < 0, do: 100 + dial_position, else: dial_position)
  end

  def solve_part2(input) do
    # Do the second part here
  end
end
