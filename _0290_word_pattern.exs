defmodule Solution do
  def do_check([], [], _, _), do: true
  def do_check([], _, _, _), do: false
  def do_check(_, [], _, _), do: false

  def do_check([p_head | p_tail], [s_head | s_tail], ps_map, sp_map) do
    cond do
      ps_map[p_head] && ps_map[p_head] == s_head && sp_map[s_head] == p_head ->
        do_check(p_tail, s_tail, ps_map, sp_map)

      !ps_map[p_head] && !sp_map[s_head] ->
        do_check(p_tail, s_tail, Map.put(ps_map, p_head, s_head), Map.put(sp_map, s_head, p_head))

      true ->
        false
    end
  end

  def word_pattern(pattern, s) do
    do_check(String.graphemes(pattern), String.split(s), %{}, %{})
  end
end
