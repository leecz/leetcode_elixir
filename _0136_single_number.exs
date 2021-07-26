defmodule Solution do
  use Bitwise

  def single_number(nums) do
    nums |> Enum.reduce(fn i, acc -> acc ^^^ i end)
  end
end

Solution.single_number([1, 2, 3, 3, 2, 1, 4]) |> IO.puts()
