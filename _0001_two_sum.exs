defmodule Solution do
  def do_sum(map, [{val, index} | tail], target) do
    if(map[target - val]) do
      [index, map[target - val]]
    else
      do_sum(Map.put(map, val, index), tail, target)
    end
  end

  def two_sum(nums, target) do
    index_nums = nums |> Enum.with_index()
    do_sum(%{}, index_nums, target)
  end
end
