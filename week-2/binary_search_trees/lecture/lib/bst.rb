# BSTNode =

class BinarySearchTree

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_tree_node(@root, value)
  end

  def find(value, tree_node = @root)
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def insert_tree_node(tree_node, value)
    return BSTNode.new(value) if tree_node.nil?

    if value <= tree_node.value
      tree_node.left = insert_tree_node(tree_node.left, value)
    elsif value > tree_node.value
      tree_node.right = insert_tree_node(tree_node.right, value)
    end

    tree_node
  end

  def delete_from_tree(tree_node, value)
    return nil if tree_node.nil?

    if tree_node.value == value
      tree_node = remove(tree_node)
    elsif value <= tree_node.value
      tree_node.left = delete_from_tree(tree_node.left, value)
    else
      tree_node.right = delete_from_tree(tree_node.right, value)
    end

    tree_node
  end

  def remove(node)
    if node.left.nil? && node.right.nil?
      node = nil
    elsif node.left && node.right.nil?
      node = node.left
    elsif node.left.nil? && node.right
      node = node.right
    else
      node = change_parent(node)
    end
  end

  def change_parent(node)
    replacement_node = maximum(node.left)
    if replacement_node.left
      promote_child(node.left)
    end

    replacement_node.left = node.left
    replacement_node.right = node.right

    replacement_node
  end

  def promote_child(node)
    if node.right
     current_parent = node
     maximum_node = maximum(node.right)
    else
      return node
    end
    current_parent.right = maximum_node.left
  end

end
