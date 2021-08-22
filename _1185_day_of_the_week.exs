defmodule Solution do
  def day_of_the_week(day, month, year) do
    {:ok, date} = Date.new(year, month, day)
    weeks = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    Enum.at(weeks, Date.day_of_week(date) - 1)
  end
end

# 要熟悉Elixir时间日期库的用法
# 还有一个日期魔数 ~D[2021-08-22] 但是好像没法替换变量。
