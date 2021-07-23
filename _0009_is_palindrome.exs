defmodule Solution do
  # 超时解法 1
  # def is_palindrome(x) do
  #   if(x < 0) do
  #     false
  #   else
  #     r = Integer.to_string(x)
  #     r === String.reverse(r)
  #   end
  # end

  # 依然超时
  # def is_palindrome(x) when x < 0, do: false
  # def is_palindrome(0), do: true

  # def is_palindrome(x) do
  #   num_list = Integer.digits(x)
  #   num_list === Enum.reverse(num_list)
  # end

  def do_check(x, cur, 0) do
    x === cur
  end

  def do_check(x, cur, left) do
    do_check(x, cur * 10 + rem(left, 10), div(left, 10))
  end

  def is_palindrome(x) when x < 0, do: false
  def is_palindrome(0), do: true

  def is_palindrome(x) do
    do_check(x, 0, x)
  end
end

Solution.is_palindrome(1_182_002_811) |> IO.puts()
Solution.is_palindrome(1_165_775_611) |> IO.puts()
Solution.is_palindrome(1_179_999_711) |> IO.puts()
