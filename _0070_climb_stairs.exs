defmodule Solution do
  def do_climb(n, cur, p1, p2) when n == cur do
    p1 + p2
  end

  def do_climb(n, cur, p1, p2) do
    do_climb(n, cur + 1, p1 + p2, p1)
  end

  def climb_stairs(1), do: 1
  def climb_stairs(2), do: 2

  def climb_stairs(n) do
    do_climb(n, 3, 2, 1)
  end
end

Solution.climb_stairs(3) |> IO.puts()
Solution.climb_stairs(5) |> IO.puts()
