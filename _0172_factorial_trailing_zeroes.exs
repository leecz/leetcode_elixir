defmodule Solution do
  def do_calc(n, result) when n < 5, do: result

  def do_calc(n, result) do
    cur = div(n, 5)
    do_calc(cur, cur + result)
  end

  def trailing_zeroes(n) do
    do_calc(n, 0)
  end
end

Solution.trailing_zeroes(125) |> IO.puts()
