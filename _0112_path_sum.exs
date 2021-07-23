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
  def do_sum(nil, _), do: false

  def do_sum(root, target) do
    if(root.left == nil && root.right == nil && root.val == target) do
      true
    else
      cur_left = target - root.val
      do_sum(root.left, cur_left) || do_sum(root.right, cur_left)
    end
  end

  def has_path_sum(root, target_sum) do
    do_sum(root, target_sum)
  end
end
