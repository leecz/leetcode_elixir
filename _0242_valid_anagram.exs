defmodule Solution do
  def do_compare("", ""), do: true
  def do_compare(s, t) do
    c = String.first(s)
    ss = String.split(s, c) |> Enum.join()
    tt = String.split(t, c) |> Enum.join()
    if(String.length(ss) !== String.length(tt)) do
      false
    else
      do_compare(ss, tt)
    end
  end
  def is_anagram(s, t) do
    if(String.length(s) !== String.length(t)) do
      false
    else
      do_compare(s, t)
    end
  end
end
