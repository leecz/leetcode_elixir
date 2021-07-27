# Definition for singly-linked list.
#
defmodule ListNode do
  @type t :: %__MODULE__{
          val: integer,
          next: ListNode.t() | nil
        }
  defstruct val: 0, next: nil
end

## 算法来源， https://gist.github.com/aaruel/3b4cfac8be09f3eec31e8fe7db295834，最下面有完整代码。
## 妙啊妙啊
## 一直想的是先递归到尾部，然后在做反转， 怎么都不好搞，因为Elixir是不可变的，不太好操作。
## 这个算法是在递归到尾部的过程中，就一直做反转，到尾部就已经反转完成。真不错！！！

defmodule Solution do
  def do_reverse(head, rev \\ nil) do
    if(head.next == nil) do
      %ListNode{ head | next: rev}
    else
      do_reverse(head.next, %ListNode{ head | next: rev})
    end

  end
  def reverse_list(head) when is_nil(head), do: head
  def reverse_list(head) do
    do_reverse(head)
  end

  def test() do
    nodes = %ListNode{
      val: 1,
      next: %ListNode {
        val: 2,
        next: %ListNode {
          val: 3,
          next: %ListNode {
            val: 4,
            next: nil
          }
        }
      }
    }
    reverse_list(nodes)
  end
end

Solution.test() |> IO.inspect()

### 上面链接中，很有参考意义的代码：
defmodule LinkedList do
    defstruct data: 0,
        next: nil,
        index: 0

    def new(data \\ 0, index \\ 0) do
        %__MODULE__{data: data, index: index}
    end

    def push(
        curr = %__MODULE__{next: next, index: index},
        data
    ) do
        if next != nil do
            %{curr | next: push(next, data)}
        else
            %{curr | next: new(data, index + 1)}
        end
    end

    def size(%__MODULE__{next: next, index: index}) do
        if !is_empty(next) do
            size(next)
        else
            index + 1
        end
    end

    def head(%__MODULE__{data: data}) do
        data
    end

    def tail(%__MODULE__{data: data, next: next}) do
        if !is_empty(next) do
            tail(next)
        else
            data
        end
    end

    def pop(%__MODULE__{next: next}) do
        next
    end

    def is_empty(%__MODULE__{}) do
        false
    end

    def is_empty(_) do
        true
    end

    defp reverseimpl(list = %__MODULE__{next: next}, index, rev \\ nil) do
        if !is_empty(next) do
            reverseimpl(next, index - 1, %{list | next: rev, index: index})
        else
            %{list | next: rev, index: index}
        end
    end

    def reverse(list = %__MODULE__{}) do
        reverseimpl(list, size(list) - 1)
    end
end

ll = LinkedList.new
    |> LinkedList.push(1)
    |> LinkedList.push(2)
    |> LinkedList.push(3)
    |> LinkedList.push(4)
    |> LinkedList.push(5)

IO.inspect(ll |> LinkedList.reverse)
