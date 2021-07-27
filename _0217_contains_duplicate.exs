defmodule Solution do
  def contains_duplicate(nums) do
    list_len = nums |> length()
    set_len = MapSet.new(nums) |> MapSet.size()
    list_len !== set_len
  end
end
