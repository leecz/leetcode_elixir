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
  def travel(nil), do: []

  def travel(%TreeNode{left: left, right: right, val: val} = tree) do
    travel(left) ++ [val] ++ travel(right)
  end

  def inorder_traversal(root) when is_nil(root), do: root

  def inorder_traversal(root) do
    travel(root)
  end
end
