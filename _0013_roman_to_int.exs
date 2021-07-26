defmodule Solution do
  def do_trans(s,sum, _, _) when length(s) == 0, do: sum
  def do_trans([first | []],sum, roman_map, roman_double_map) do
    do_trans([], sum + roman_map[first], roman_map, roman_double_map )
  end
  def do_trans([first, second | tail], sum, roman_map, roman_double_map) do
    cond do
      n = roman_double_map[first <> second] ->
        do_trans(tail, sum + n, roman_map, roman_double_map )
      m = roman_map[first] ->
        do_trans([second] ++ tail, sum + m, roman_map, roman_double_map )
    end
  end

  def roman_to_int(s) do
    roman_map = %{"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
    roman_double_map = %{"IV" => 4, "IX" => 9, "XL" => 40, "XC" => 90, "CD" => 400, "CM" => 900}
    # do_trans(String.graphemes(s), 0, roman_map, roman_double_map)
    do_trans_2(String.graphemes(s), 0, roman_map)
  end
  #### 上面是我的写法， 下面是论坛的解法

  def do_trans_2(l, sum, _) when length(l) == 0, do: sum
  def do_trans_2([first | []], sum, roman_map) do
    do_trans_2([], sum + roman_map[first], roman_map)
  end
  def do_trans_2([first, second | tail], sum, roman_map) do
    if(roman_map[first] < roman_map[second]) do
      do_trans_2(tail, sum + roman_map[second] - roman_map[first], roman_map)
    else
      do_trans_2([second] ++ tail, sum + roman_map[first], roman_map)
    end
  end
end

Solution.roman_to_int("III") |> IO.puts()
Solution.roman_to_int("MCMXCIV") |> IO.puts()
