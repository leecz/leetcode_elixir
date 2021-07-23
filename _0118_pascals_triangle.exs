defmodule Solution do
  def do_gen_row([first | []]), do: [1]

  def do_gen_row([first, second | tail]) do
    [first + second | do_gen_row([second | tail])]
  end

  def do_gen(nums_rows, result) when nums_rows == 2, do: result

  def do_gen(nums_rows, [head | tail] = result) do
    list = [1 | do_gen_row(head)]
    do_gen(nums_rows - 1, [list | result])
  end

  def generate(1), do: [[1]]
  def generate(2), do: [[1], [1, 1]]

  def generate(num_rows) do
    do_gen(num_rows, [[1, 1], [1]]) |> Enum.reverse()
  end
end
