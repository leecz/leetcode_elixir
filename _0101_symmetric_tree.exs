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
  def equal(nil, nil), do: true
  def equal(left, nil), do: false
  def equal(nil, right), do: false

  def equal(left, right) do
    if(left.val !== right.val) do
      false
    else
      equal(left.left, right.right) && equal(left.right, right.left)
    end
  end

  def is_symmetric(root) do
    equal(root.left, root.right)
  end
end
