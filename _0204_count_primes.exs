defmodule Solution do
  def do_isnp_map(n, i, [head | _], isnp_map) when i * head > n, do: isnp_map
  def do_isnp_map(_, _, [], isnp_map), do: isnp_map

  def do_isnp_map(n, i, [head | tail], isnp_map) do
    cur_map = Map.put(isnp_map, head * i, 1)

    if(rem(i, head) == 0) do
      cur_map
    else
      do_isnp_map(n, i, tail, cur_map)
    end
  end

  def do_calc(n, i, _, primes) when i >= n, do: primes

  def do_calc(n, i, isnp_map, primes) do
    cur_primes = if !isnp_map[i], do: primes ++ [i], else: primes

    cur_isnp_map = do_isnp_map(n, i, cur_primes, isnp_map)
    do_calc(n, i + 1, cur_isnp_map, cur_primes)
  end

  def count_primes(0), do: 0
  def count_primes(1), do: 0
  def count_primes(2), do: 1

  def count_primes(n) do
    do_calc(n, 2, %{}, []) |> Enum.count()
  end
end

Solution.count_primes(10) |> IO.inspect()
Solution.count_primes(999_983) |> IO.inspect()

## 超时
