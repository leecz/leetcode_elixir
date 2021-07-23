defmodule Solution do
  def calc([], max_profit, last_profit, _), do: max_profit + last_profit

  def calc([head | tail], max_profit, last_profit, buy) do
    # 两种情况: 买，不买
    cur_profit = head - buy

    if(cur_profit >= last_profit) do
      # 不买
      calc(tail, max_profit, cur_profit, buy)
    else
      # 买
      calc(tail, max_profit + last_profit, 0, head)
    end
  end

  def max_profit(prices) do
    calc(prices, 0, 0, hd(prices))
  end
end

Solution.max_profit([7, 1, 5, 3, 6, 5]) |> IO.puts()
Solution.max_profit([7, 6, 5, 3, 1]) |> IO.puts()
Solution.max_profit([1, 2, 3, 4, 5]) |> IO.puts()
