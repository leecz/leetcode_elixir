defmodule Solution do
  def do_check([], []), do: true
  def do_check([], stack) when length(stack) !== 0, do: false

  def do_check([head | tail], stack) do
    stack_head = List.first(stack)
    stack_tail = Enum.slice(stack, 1..-1)

    cond do
      head === "(" ->
        do_check(tail, [head | stack])

      head === "[" ->
        do_check(tail, [head | stack])

      head === "{" ->
        do_check(tail, [head | stack])

      head === ")" && stack_head === "(" ->
        do_check(tail, stack_tail)

      head === "]" && stack_head === "[" ->
        do_check(tail, stack_tail)

      head === "}" && stack_head === "{" ->
        do_check(tail, stack_tail)

      true ->
        false
    end
  end

  def is_valid(s) do
    do_check(String.graphemes(s), [])
  end
end

Solution.is_valid("()[]{}") |> IO.puts()
Solution.is_valid("([)]") |> IO.puts()
Solution.is_valid("[") |> IO.puts()

# 空的列表如何匹配
