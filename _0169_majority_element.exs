defmodule Solution do
  def do_count([], _, max_num), do: max_num

  def do_count([head | tail], count_map, max_num) do
    cur_map = Map.update(count_map, head, 1, fn val -> val + 1 end)

    if cur_map[head] > cur_map[max_num] do
      do_count(tail, cur_map, head)
    else
      do_count(tail, cur_map, max_num)
    end
  end

  def majority_element(nums) do
    do_count(nums, %{}, hd(nums))
  end
end

Solution.majority_element([2, 2, 2, 1, 1, 2, 1, 1, 2]) |> IO.puts()
