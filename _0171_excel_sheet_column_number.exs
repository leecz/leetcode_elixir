defmodule Solution do
  def do_calc([], result, _), do: result

  def do_calc([head | tail], result, n) do
    cur = (head - 64) * Integer.pow(26, n) + result
    do_calc(tail, cur, n + 1)
  end

  def title_to_number(column_title) do
    char_list = String.to_charlist(column_title) |> Enum.reverse()
    do_calc(char_list, 0, 0)
  end
end
