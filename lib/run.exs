# mix run lib/run.exs 01

[day] = System.argv()
input = File.read!("input/day#{day}.txt")

module = Module.concat(["Day#{day}"])
IO.puts("Part 1: #{apply(module, :solve_part1, [input])}")
IO.puts("Part 2: #{apply(module, :solve_part2, [input])}")
