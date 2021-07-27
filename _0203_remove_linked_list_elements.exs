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
  @spec remove_elements(head :: ListNode.t() | nil, val :: integer) :: ListNode.t() | nil
  def remove_elements(nil, _), do: nil

  def remove_elements(head, val) do
    if(head.val === val) do
      remove_elements(head.next, val)
    else
      %ListNode{head | next: remove_elements(head.next, val)}
    end
  end
end
