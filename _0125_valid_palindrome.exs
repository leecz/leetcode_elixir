defmodule Solution do
  def is_number_or_letter(c) do
    ("0" <= c && c <= "9") || ("a" <= c && c <= "z")
  end

  def do_compare(_, l, r) when l >= r, do: true

  def do_compare(s, l, r) do
    head = String.at(s, l)
    last = String.at(s, r)

    cond do
      head == last ->
        do_compare(s, l + 1, r - 1)

      !is_number_or_letter(head) ->
        do_compare(s, l + 1, r)

      !is_number_or_letter(last) ->
        do_compare(s, l, r - 1)

      true ->
        false
    end
  end

  def is_palindrome(s) do
    do_compare(String.downcase(s), 0, String.length(s) - 1)
  end
end

# 超时
