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
  def travel(nil, nil), do: true
  def travel(p, nil), do: false
  def travel(nil, q), do: false

  def travel(p, q) do
    if(p.val == q.val) do
      travel(p.left, q.left) && travel(p.right, q.right)
    else
      false
    end
  end

  def is_same_tree(p, q) do
    travel(p, q)
  end
end
