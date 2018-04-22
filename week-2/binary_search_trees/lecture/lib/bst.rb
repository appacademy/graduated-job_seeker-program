BSTNode = Struct.new(:value, :left, :right)

class BinarySearchTree

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_tree_node(@root, value)
    # make new node based on value, if root is nil make the new node the root.
    # If value is greater than root.value, recusively inser the value to root.right
    # else recursivley insert the value to root.left.
  end

  def find(value, tree_node = @root)
    # examine the value of the node
    # if the node.value == value, return node
    # elsif value is > recursivley examin node.right
    # else recursively examine node.left
    # return nil if value does not exist.
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value

    if value <= tree_node.value
      return find(value, tree_node.left)
    else
      return find(value, tree_node.right)
    end
  end

  def delete(value)
    # recursively search for the node
    # if node has no children: simply set node to nil
    # if node has one child, replace node with the child.
    # if node has two children, replace node with the maximum of it's smaller children. If that node has a left side, promote that left side to the node's previous position.
    @root = delete_from_tree(@root, value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    # return tree_node if tree_node.right.nil?
    # maximum(tree_node.right)
    return tree_node if tree_node.right.nil?

    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    # from any given node, examine the depth of it's two branches, return the greater value of the two.
    # return -1 if node.nil?
    # left = 1 + recursive call on left
    # right = 1 + recusive call on right
    # return [left, right].max
    return -1 if tree_node.nil?

    right = depth(tree_node.right)
    left = depth(tree_node.left)

    left > right ? left + 1 : right + 1
  end

  def is_balanced?(tree_node = @root)
    # recursivley examine the depths at each root and ensure they're all different by at max 1
    # return true if node.nil?
    # balanced = (depth(node.left) - depth(node.right)).abs <= 1
    # balanced && is_balanced(node.left) && is_balanced(node.right)
    return true if tree_node.nil?

    balanced = (depth(tree_node.left) - depth(tree_node.right)).abs <= 1

    balanced && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])

    # We need to make sure we're taking in an array in our args to make this recursive.
    # Pattern should always be left, self, right.
    # Why does this work?  Why do we not need to assign the recursive call to a variable?
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
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

# get to the largest node
# climb back up the tree, keeping track of how many nodes you've travesed and the target node if you have it
# can we do this recursively with the given constraint of arguments?
# helper function? Recursive helper function?
# how can we keep track of both the count and the node?
# we only care about nodes if the count is less than/equal to k
# what if the node is nil?
# we do not need to return early
# When do we check the right?
# when do we include the node we're on?
# when do we look at the left child?

def kth_largest(tree_node, k)
  kth_node = { count: 0, correct_node: nil }
  reverse_in_order(tree_node, kth_node, k)[:correct_node]
end

def reverse_in_order(tree_node, kth_node, k)
  if tree_node && kth_node[:count] < k
    kth_node = reverse_in_order(tree_node.right, kth_node, k)
    if kth_node[:count] < k
      kth_node[:count] += 1
      kth_node[:correct_node] = tree_node
    end

    if kth_node[:count] < k
      kth_node = reverse_in_order(tree_node.left, kth_node, k)
    end
  end

  kth_node
end
