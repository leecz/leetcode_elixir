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

  def do_add(nil, nil, 0), do: nil
  def do_add(nil, nil, p) do
    %ListNode{
      val: p,
      next: nil
    }
  end
  def do_add(head1, nil, p), do: do_add(nil, head1, p)
  def do_add(nil, head2, 0), do: head2
  def do_add(nil, head2, p), do: do_add(%ListNode{}, head2, p)
  def do_add(head1, head2, p) do
    sum = head1.val + head2.val + p
    %ListNode{
      val: rem(sum, 10),
      next: do_add(head1.next, head2.next, div(sum, 10))
    }
  end


  def add_two_numbers(l1, l2) when is_nil(l1), do: l2
  def add_two_numbers(l1, l2) when is_nil(l2), do: l1
  def add_two_numbers(l1, l2) do
    do_add(l1, l2, 0)
  end

  def test() do
    l1 = %ListNode{val: 6, next: nil}
    l2 = %ListNode{val: 7, next: %ListNode{val: 9, next: nil}}
    add_two_numbers(l1, l2) |> IO.inspect()
  end


end

Solution.test()
