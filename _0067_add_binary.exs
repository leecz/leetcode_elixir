defmodule Solution do
  def add_binary(a, b) do
    (String.to_integer(a, 2) + String.to_integer(b, 2)) |> Integer.to_string(2)
  end
end
