# Partner A Asks Partner B

### Shortest Distance Between Nodes

Write a method, `shortestDistance`, that takes in a `root` node and two node _values_. This method should return the shortest distance between these two nodes.

**Example:**
```
      5
    /   \
   2     7
  / \   / \  
 1  4  6   11
   /         \
  3          15
            /
           13

shortestDistance(rootNode, 2, 7)
Output: 2

shortestDistance(rootNode, 4, 6)
Output: 4

shortestDistance(rootNode, 1, 2)
Output: 1

shortestDistance(rootNode, 7, 7)
Output: 0
```

**Info:**
* In every scenario, you may assume that the values we are searching for exist in the tree
* The function will take two _values_ of nodes. Not the nodes themselves. (i.e., `findShortestDistance(rootNode, 4, 11)`)
* The method should operate in `O(log(n))` time complexity and `O(1)` space complexity.


**Approach:** Remember that we will only need a `Node` class, not a `Tree` class. The `Node` should be a simple constructor function that takes in a value, a left node (defaults to null), and a right node (also defaults to null). **The Node class should not hold onto a `parent` value.**

Your partner may be inclined to start at each node and try and go up. If they take this approach, tell them that they should consider taking a **top down** approach.

Let your partner discuss their thoughts. Encourage them to consider using helper methods. If we draw out a tree, and find the distance manually, does your partner have any realizations? What information to we need to find _first_ before we can calculate the distance?


### Solution:


```js
function Node(value, left = null, right = null) {
  this.left = left;
  this.right = right;
  this.value = value;
}

function shortestDistance(rootNode, firstVal, secondVal) {
  const ancestor = leastCommonAncestor(rootNode, firstVal, secondVal);
  const dist1 = findDepth(ancestor, firstVal);
  const dist2 = findDepth(ancestor, secondVal);

  return dist1 + dist2;
}

function leastCommonAncestor(rootNode, firstVal, secondVal) {
  if (firstVal > rootNode.value && secondVal > rootNode.value) {
    return leastCommonAncestor(rootNode.right, firstVal, secondVal);
  } else if (firstVal < rootNode.value && secondVal < rootNode.value) {
    return leastCommonAncestor(rootNode.left, firstVal, secondVal);
  } else {
    return rootNode;
  }
};

function findDepth(root, value) {  
  if (root.value === value)
    return 0;
  else if (root.value > value)
    return 1 + findDepth(root.left, value);
  else
    return 1 + findDepth(root.right, value);
};
```


**Explanation:**
The idea here is that we want to do this problem in 3 steps:
* First, we need to find the least common ancestor for both values. We can write a helper function, `leastCommonAncestor`
  * We can take a top-down approach here. Start at the root, and traverse until the values are not in the same subtree.
  * As we traverse, we know that we are at the LCA for two values if the values are in different sub-trees (i.e. `val1` lives in the `left` subtree, `val2` lives in the `right` subtree). If they are both in the same subtree (_both_ greater than current value, or _both_ less than current value), then we look for the ancestor in that subtree.
  * For the example tree in the instructions in this problem, the LCA for `13` and `6` is `7`. For `2` and `4` it is 2.
* Find the distance from the LCA to each node. We can write a helper function, `findDepth`
* Sum the two distances.
