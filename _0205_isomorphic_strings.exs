defmodule Solution do
  # def do_check(s, t, i, len) when i == l, do: true

  # def do_check(s, t, i, len) do
  #   si = Enum.at(s, i)
  #   ti = Enum.at(t, i)

  #   if(Enum.find_index(s, &(&1 == si)) == Enum.find_index(t, &(&1 == ti))) do
  #     do_check(s, t, i + 1, len)
  #   else
  #     false
  #   end
  # end

  # def is_isomorphic(s, t) do
  #   if(String.length(s) !== String.length(t)) do
  #     false
  #   else
  #     do_check(String.graphemes(s), String.graphemes(t), 0, String.length(s))
  #   end
  # end

  def do_check([], [], _, _), do: true
  def do_check([], _, _, _), do: false
  def do_check(_, [], _, _), do: false

  def do_check([s_head | s_tail], [t_head | t_tail], s_char_map, t_char_map) do
    cond do
      s_char_map[s_head] && s_char_map[s_head] == t_head && t_char_map[t_head] == s_head ->
        do_check(s_tail, t_tail, s_char_map, t_char_map)

      !s_char_map[s_head] && !t_char_map[t_head] ->
        do_check(
          s_tail,
          t_tail,
          Map.put(s_char_map, s_head, t_head),
          Map.put(t_char_map, t_head, s_head)
        )

      true ->
        false
    end
  end

  def is_isomorphic(s, t) do
    do_check(String.graphemes(s), String.graphemes(t), %{}, %{})
  end
end
