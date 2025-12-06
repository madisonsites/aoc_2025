# 🎄 Advent of Code 2025 — Elixir Edition 🧪✨

**Welcome to my AoC 2025 Playground**

This repository contains my solutions for [Advent of Code 2025](https://adventofcode.com/2025).

This year I'm using it to finally play around with Elixir.

---

## 🧪 Running Solutions

Putting this here to make it easier on myself to remember how to run the interactive console:

```elixir
iex -S mix
```

### Run the tests

```elixir
mix test
```

### Day 1

```elixir
input = File.read!("input/day01.txt") |> String.split("\n", trim: true)
Day01.solve(input)
```

## 📁 Project Structure

```bash
aoc_2025/
│
├─ lib/
│   ├─ day01.ex            # Solutions for Day 1
│   └─ ...                 # One file per day
│
├─ input/
│   ├─ day01.txt           # Actual puzzle input
│   ├─ day01-short.txt     # Sample input from problem text
│   └─ ...
│
└─ test/
    ├─ day01_test.exs
    └─ ...
```


## 🏆 Progress

| Day | Stars |
| --- | ----- |
| 01  | ⭐⭐   |
| 02  | ⭐⭐   |
| 03  | ⏳     |
| 04  | ❓     |
| 05  | ❓     |
| 06  | ❓     |
| 07  | ❓     |
| 08  | ❓     |
| 08  | ❓     |
| 10  | ❓     |
| 11  | ❓     |
| 12  | ❓     |

