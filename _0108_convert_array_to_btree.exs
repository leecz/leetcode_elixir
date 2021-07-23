# Definition for a binary tree node.
#
defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  def trans(_, l, r) when r < l, do: nil

  def trans(nums, l, r) do
    mid = l + div(r - l, 2)

    %TreeNode{
      val: Enum.at(nums, mid),
      left: trans(nums, l, mid - 1),
      right: trans(nums, mid + 1, r)
    }
  end

  def sorted_array_to_bst(nums) do
    trans(nums, 0, length(nums))
  end
end
