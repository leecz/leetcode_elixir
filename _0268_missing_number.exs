defmodule Solution do
  def missing_number(nums) do
    len = nums |> Enum.count()
    sum1 = div((1 + len) * len, 2)
    sum2 = nums |> Enum.sum()
    sum1 - sum2
  end
end
