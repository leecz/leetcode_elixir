defmodule Solution do
  def do_gen_row([first | []]), do: [1]

  def do_gen_row([first, second | tail]) do
    [first + second | do_gen_row([second | tail])]
  end

  def do_gen(nums_rows, result) when nums_rows == 1, do: result

  def do_gen(nums_rows, result) do
    do_gen(nums_rows - 1, [1 | do_gen_row(result)])
  end

  def get_row(0), do: [1]
  def get_row(1), do: [1, 1]

  def get_row(row_index) do
    do_gen(row_index, [1, 1])
  end
end
