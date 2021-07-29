defmodule Solution do
  def can_win_nim(n) do
    rem(n, 4) !== 0
  end
end
