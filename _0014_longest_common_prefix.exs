defmodule Solution do
  def do_check(_, "", common), do: common
  def do_check(strs, str, common) do
    letter = common <> String.first(str)
    result = Enum.all?(strs, fn s -> String.starts_with?(s, letter) end)
    if(result) do
      do_check(strs, String.slice(str, 1..-1), letter)
    else
      common
    end
  end
  def longest_common_prefix([head | tail]) do
    do_check(tail, head, "")
  end
end

# Solution.longest_common_prefix(["aaaaab", "aaaab", "aaa"]) |> IO.puts
Solution.longest_common_prefix(["flower","flow","floight"]) |> IO.puts
