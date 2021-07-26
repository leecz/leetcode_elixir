defmodule Solution do
  def sqrt(c, x0) do
    xi = 0.5 * (x0 + c / x0)
    if abs(xi - x0) <= 0.00000001, do: xi, else: sqrt(c, xi)
  end
  def my_sqrt(0), do: 0
  def my_sqrt(x) do
    sqrt(x, x) |> floor()
  end
end

Solution.my_sqrt(8) |> IO.puts()
