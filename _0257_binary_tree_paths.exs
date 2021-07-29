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
  def do_traval(nil, result, _), do: result

  def do_traval(root, result, path) do
    if(root.left == nil && root.right == nil) do
      result ++ [path <> "#{root.val}"]
    else
      cur_path = path <> "#{root.val}->"
      cur_result = do_traval(root.left, result, cur_path)
      do_traval(root.right, cur_result, cur_path)
    end
  end

  def binary_tree_paths(root) do
    do_traval(root, [], "")
  end
end
