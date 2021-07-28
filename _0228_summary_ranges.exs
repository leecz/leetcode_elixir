defmodule Solution do
  def do_ranges([], result, start, prev) do
      r = if start == prev, do: "#{start}", else: "#{start}->#{prev}"
      result ++ [r]
  end
  def do_ranges([head | tail], result, start, prev) do
    # head -> a: 结束当前区间, b: 继续加一
    if(head - prev > 1) do
      r = if start == prev, do: "#{start}", else: "#{start}->#{prev}"
      do_ranges(tail, result ++ [r], head, head)
    else
      do_ranges(tail, result, start, head)
    end
  end
  def summary_ranges([]), do: []
  def summary_ranges(nums) do
    do_ranges(nums, [], List.first(nums), List.first(nums))
  end
end
