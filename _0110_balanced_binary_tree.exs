# Definition for a binary tree node.

defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  def travel(nil), do: 0

  def travel(root) do
    l = travel(root.left)
    r = travel(root.right)
    if l >= 0 && r >= 0 && abs(l - r) <= 1, do: max(l, r) + 1, else: -1
  end

  def is_balanced(root) do
    travel(root) >= 0
  end
end
