defmodule Solution do
  def do_check(1, _), do: true
  def do_check(_, []), do: false

  def do_check(n, [head | tail] = primes) do
    if(rem(n, head) == 0) do
      do_check(div(n, head), primes)
    else
      do_check(n, tail)
    end
  end

  def is_ugly(1), do: true
  def is_ugly(n) when n < 0, do: false

  def is_ugly(n) do
    do_check(n, [2, 3, 5])
  end
end
