defmodule Solution do
  def do_calc([head | tail], index, cache_map, target ) do
    left = target - head
    if(cache_map[left]) do
      [cache_map[left] + 1, index + 1]
    else
      do_calc(tail, index + 1, Map.put(cache_map, head, index), target)
    end
  end
  @spec two_sum(numbers :: [integer], target :: integer) :: [integer]
  def two_sum(numbers, target) do
    do_calc(numbers, 0, %{}, target)
  end
end

Solution.two_sum([2, 4, 7, 11, 15], 9) |> IO.inspect()
