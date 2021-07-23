# Definition for singly-linked list.
#

defmodule ListNode do
  defstruct val: 0, next: nil
end

defmodule Solution do
  def do_merge(nil, l2), do: l2
  def do_merge(l1, nil), do: l1

  def do_merge(l1, l2) do
    if l1.val > l2.val, do: do_merge(l2, l1), else: %ListNode{l1 | next: do_merge(l1.next, l2)}
    # 更新 structs 的方法是上面这种哦
  end

  def merge_two_lists(l1, l2) do
    do_merge(l1, l2)
  end

  def test() do
    l1 = %ListNode{val: 1, next: %ListNode{val: 2, next: %ListNode{val: 4, next: nil}}}
    l2 = %ListNode{val: 1, next: %ListNode{val: 3, next: %ListNode{val: 4, next: nil}}}
    merge_two_lists(l1, l2) |> IO.inspect()
  end
end

Solution.test()
