defmodule Solution do
  def str_str(_, ""), do: 0

  def str_str(haystack, needle) do
    if(String.contains?(haystack, needle)) do
      list = String.split(haystack, needle)
      String.length(hd(list))
    else
      -1
    end
  end
end

Solution.str_str("hello", "ll") |> IO.puts()
Solution.str_str("hello", "") |> IO.puts()
