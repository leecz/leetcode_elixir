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
  def preorder_traversal(nil), do: []

  def preorder_traversal(root) do
    [root.val] ++ preorder_traversal(root.left) ++ preorder_traversal(root.right)
  end
end
