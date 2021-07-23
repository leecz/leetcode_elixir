defmodule ListNode do
  defstruct val: 0, next: nil
end

defmodule Solution do
  def delete_duplicates(%ListNode{next: next} = head) when is_nil(next), do: head

  def delete_duplicates(head) do
    cond do
      head === nil ->
        head

      head.val == head.next.val ->
        delete_duplicates(head.next)

      true ->
        %ListNode{head | next: delete_duplicates(head.next)}
    end
  end

  def test() do
    l1 = %ListNode{
      val: 1,
      next: %ListNode{val: 2, next: %ListNode{val: 2, next: %ListNode{val: 4, next: nil}}}
    }

    delete_duplicates(l1)
  end
end

Solution.test() |> IO.inspect()
