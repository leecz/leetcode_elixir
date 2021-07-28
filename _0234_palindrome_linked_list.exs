# Definition for singly-linked list.
#
defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

defmodule Solution do

  def do_reverse(head, rev \\ nil, i) do
    if(head.next == nil) do
      {%ListNode{ head | next: rev}, i + 1}
    else
      do_reverse(head.next, %ListNode{ head | next: rev}, i+1)
    end
  end

  def do_check(list, r_list, i, len) when i == len do
    list.val == r_list.val
  end
  def do_check(list, r_list, i, len) do
    if(list.val !== r_list.val) do
      false
    else
      do_check(list.next, r_list.next, i + 1, len)
    end
  end

  def is_palindrome(head) do
    {reversed_list, len} = do_reverse(head, nil, 0)
    half = div(len, 2)
    do_check(head, reversed_list, 0, half)
  end
end
