defmodule Solution do
  def do_sum([], max_sum, _), do: max_sum
  def do_sum([head | tail], max_sum, list_sum) do
    cur_sum = if list_sum > 0, do: head + list_sum, else: head
    do_sum(tail, max(max_sum, cur_sum), cur_sum)
  end
  def max_sub_array([head | []]) do
    head
  end
  def max_sub_array([head | _] = nums) do
    do_sum(nums, head, 0)
  end
end


Solution.max_sub_array([5,4, -1, 7, 8]) |> IO.puts()

# 这个题真的不简单哦，等学了动态规划再来看看
