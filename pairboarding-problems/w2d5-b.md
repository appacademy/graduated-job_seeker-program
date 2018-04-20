# Partner B Asks Partner A

## Validate Binary Search Tree

Write a method, `isBST`, that checks if a given Binary Tree is a **Binary Search Tree**.

**Example:**
```
  13
 /   \
8    18

isBST(Root 13)
Output: True

    13
   /  \
  8    18
 /  \
6   14

isBST(Root 13)
Output: False

5

isBST(Root 5)
Output: True

isBST(NULL)
Output: True
```

Keep in mind, an empty Binary Search Tree is still a valid Binary Search Tree. `isBST(null)` should return `true`.


### Common Mistake

A very common solution to this algorithm is to write a method that, for each node, checks if the right node is greater and the left node is smaller. That might look something like this:

```js
function Node(value, left = null, right = null) {
  this.value = value;
  this.left = left;
  this.right = right;
}

function isBST(root) {
  if (root === null) return true;

  if (root.left.value > root.value || root.right.value < root.value)
    return false;

  return isBST(root.left) && isBST(root.right);
}
```
**If your partner starts with this intuition, let them follow it. Ask them if they see anything wrong with this approach. If they still can't see it, draw out an example of an invalid tree that would pass as valid (see below).**

At first, this makes sense intuitively. The issue is that this method would return true for the following Binary Tree:
```
    13
   /  \
  8    18
 /  \
6   14
```

The `14` makes this tree invalid, as it should be to the _right_ of the `13`.

How can we add this logic to our program?

### Method \#2 (Correct, but Inefficient)

For each node, check if the max value in the left subtree is smaller than the node and the min value in the right subtree is greater than the node.

```js
function isBST(node) {
  if (node === null) return true;

  if (node.left && maxValue(node.left) > node.value)
    return false;

  if (node.right && minValue(node.right) < node.value)
    return false;

  return isBST(node.left) && isBST(node.right);
}
```

This method assumes that we have two helper functions, `maxValue` and `minValue`, that return the maximum and minimum values in the subtree of a given node.

While this method would work, it is not the most efficient solution. Calling `maxValue` and `minValue` for every single node makes this implementation `O(n * log(n))`.
How can we do better?

### Method \#3 (Improved)

```js
function isBST(node, minValue, maxValue) {
  if (node === null) return true;

  if (minValue && node.value < minValue)
    return false;
  if (maxValue && node.value > maxValue)
    return false;

  return isBST(node.left, minValue, node.value) &&
         isBST(node.right, node.value, maxValue);

}
```

**Explanation:**

In the Brute Force solution, we kept finding the max and min value for each node. What if this was something we stored and passed down? Consider the following tree:
```
    13
   /  \
  8    18
 /  \
6   14
```

We can check if it is valid by following these steps:
* Start at the root (`13`). `minValue` and `maxValue` are undefined in our first call to the method, so we don't run the comparison. Because we don't have these values, we make the recursive call to see if both the left and right subtrees are valid
  * When we make our recursive call to the left, we pass our _own_ value (`13`) down as the max value we have seen so far. That is because, if we are searching the **left** tree, we know we want every single node to have a value smaller than `13`
  * Vice verse for the right subtree. Pass `13` down as the minimum value we have seen. We know that there cannot be any nodes smaller than 13 in the **right** subtree.
* Once we get to the node `14`, the `maxValue` will point to `13`, and the `minValue` will point to `8`. In our comparison check, this call will return `false` because `14` is greater than the `maxValue`, making this tree invalid. 
