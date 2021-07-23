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
  def travel(nil), do: 0

  def travel(root) do
    max(travel(root.left), travel(root.right)) + 1
  end

  def max_depth(root) do
    travel(root)
  end
end
