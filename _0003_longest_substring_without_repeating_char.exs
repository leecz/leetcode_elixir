defmodule Solution do
  # 用一个 map 保存遍历的字符，用字符作为key，index 作为value
  # start 从 0 开始，遍历一遍字符，如果存在，start 就是该字符的在map中的value。

  def do_find([], _, _, max_len, _), do: max_len
  def do_find([head | tail], index, left, max_len, char_map) do
    cur_left = if char_map[head], do: max(char_map[head]+1, left), else: left
    cur_max_len = max(index - cur_left + 1, max_len)
    do_find(tail, index + 1, cur_left, cur_max_len, Map.put(char_map, head, index))
  end
  def length_of_longest_substring(s) do
    do_find(String.graphemes(s), 0, 0, 0, %{})
  end
end

Solution.length_of_longest_substring("abcabcbb") |> IO.puts()
