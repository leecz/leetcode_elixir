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
  @spec postorder_traversal(root :: TreeNode.t() | nil) :: [integer]
  def postorder_traversal(nil), do: []

  def postorder_traversal(root) do
    postorder_traversal(root.left) ++ postorder_traversal(root.right) ++ [root.val]
  end
end
