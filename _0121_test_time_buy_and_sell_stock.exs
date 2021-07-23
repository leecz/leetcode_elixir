defmodule Solution do
  def calc([], profix, _), do: profix

  def calc([head | tail], profix, buy) do
    calc(tail, max(head - buy, profix), min(head, buy))
  end

  def max_profit(prices) do
    # 计算n-1天的最大收益，跟n天的收益对比
    calc(prices, 0, hd(prices))
  end
end

Solution.max_profit([7, 1, 5, 3, 6, 5]) |> IO.puts()
Solution.max_profit([7, 6, 5, 3, 1]) |> IO.puts()
