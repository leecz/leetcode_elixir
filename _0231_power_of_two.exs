defmodule Solution do
  @spec is_power_of_two(n :: integer) :: boolean
  # def is_power_of_two(n) when n < 0, do: false
  # def is_power_of_two(n) do
  #   count = Integer.to_string(n, 2) |> String.split("1") |> Enum.count()
  #   count == 2
  # end

  # 位运算
  def is_power_of_two(n) when n < 0, do: false
  def is_power_of_two(n) do
    use Bitwise
    n &&& (n - 1) == 0
  end
end
