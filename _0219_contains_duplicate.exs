defmodule Solution do
  def do_calc([], _, _, _), do: false

  def do_calc([head | tail], i, num_map, k) do
    cond do
      num_map[head] && i - num_map[head] <= k ->
        true

      true ->
        do_calc(tail, i + 1, Map.put(num_map, head, i), k)
    end
  end

  def contains_nearby_duplicate(nums, k) do
    do_calc(nums, 0, %{}, k)
  end
end
