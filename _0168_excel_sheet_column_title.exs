defmodule Solution do
  def to_string(left, list) do
    cur = left - 1
    if(left > 26) do
      to_string(div(cur, 26) , [rem(cur, 26) + 65 | list])
    else
      [cur + 65 | list]
    end
  end
  @spec convert_to_title(column_number :: integer) :: String.t
  def convert_to_title(column_number) do
    to_string(column_number, []) |> List.to_string()
  end
end

Solution.convert_to_title(26) |> IO.puts()
Solution.convert_to_title(27) |> IO.puts()
Solution.convert_to_title(28) |> IO.puts()
Solution.convert_to_title(51) |> IO.puts()
Solution.convert_to_title(52) |> IO.puts()
Solution.convert_to_title(53) |> IO.puts()
Solution.convert_to_title(78) |> IO.puts()
Solution.convert_to_title(701) |> IO.puts()
Solution.convert_to_title(2147483647) |> IO.puts()

# A -> 1
# B -> 2
# C -> 3
