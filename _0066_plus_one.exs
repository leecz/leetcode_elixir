defmodule Solution do
  def do_plus([]), do: [1]

  def do_plus([head | tail]) do
    if(head + 1 == 10) do
      [0 | do_plus(tail)]
    else
      [head + 1 | tail]
    end
  end

  def plus_one(digits) do
    digits |> Enum.reverse() |> do_plus() |> Enum.reverse()
  end
end

Solution.plus_one([4, 3, 2, 1]) |> IO.inspect()
Solution.plus_one([4, 3, 2, 9]) |> IO.inspect()
