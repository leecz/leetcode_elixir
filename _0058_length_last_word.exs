defmodule Solution do
  def length_of_last_word(s) do
    last_word = s |> String.split() |> List.last()
    String.length(last_word || "")
  end
end
