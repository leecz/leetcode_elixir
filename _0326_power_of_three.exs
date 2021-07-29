defmodule Solution do
  def is_power_of_three(n) when n < 1, do: false

  def is_power_of_three(n) do
    rem(1_162_261_467, n) == 0
  end
end
