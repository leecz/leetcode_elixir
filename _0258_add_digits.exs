defmodule Solution do
  def add_digits(0), do: 0

  def add_digits(num) do
    rem(num - 1, 9) + 1
  end
end
