defmodule Solution do
  def next_num(n, r) when n < 10, do: r + n * n

  def next_num(n, r) do
    c = rem(n, 10)
    next_num(div(n, 10), r + c * c)
  end

  def check(n, r_map) do
    next = next_num(n, 0)

    cond do
      Map.has_key?(r_map, next) ->
        false

      next == 1 ->
        true

      true ->
        check(next, Map.put(r_map, next, next))
    end
  end

  def is_happy(n) do
    check(n, %{})
  end
end

Solution.is_happy(19) |> IO.puts()
Solution.is_happy(2) |> IO.puts()
