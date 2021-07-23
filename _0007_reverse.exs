defmodule Solution do
  def do_reverse(x) do
    x
    |> Integer.to_string()
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.join()
    |> String.to_integer()
  end

  def reverse(x) do
    r = if x < 0, do: do_reverse(-x), else: do_reverse(x)
    r = if x < 0, do: -r, else: r

    if(r > 2_147_483_647 || r < -2_147_483_648) do
      0
    else
      r
    end
  end
end

Solution.reverse(-3102) |> IO.puts()
