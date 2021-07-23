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
    if l == 0 || r == 0, do: l + r + 1, else: min(l, r) + 1
  end

  def min_depth(root), do: travel(root)
end
