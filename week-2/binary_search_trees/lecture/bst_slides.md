# BST
### (Binary Search Tree)

<img style="height: 450px; width: 600px;" src="https://blog.penjee.com/wp-content/uploads/2015/11/binary-search-tree-degenerating-demo-animation.gif"/>

---

# topics
* Refresher: What is a BST?
* Balancing a Tree
* Trees and Arrays


Note:
Questions, what do you want to cover here?
---

# Binary Search Tree

<img src="https://www.tutorialspoint.com/data_structures_algorithms/images/binary_search_tree.jpg"/>

* Collection of nodes (it's all about the nodes)
* Each node has, at max, 2 child nodes and one parent node.
* Each left child's value is less than the parent's value
* Each right child's value is greater than the parent's value.

Note:
What's a node?
What do we call a node with no parent?
Can a node with a parent be a root node?
How is this different from just a tree?  Just a binary tree?
What common tool has a BST as an underlying structure?

---

# What is the Basic API of a BST?

Note:
Insert, Find, Delete
What's the average time complexity for each?

---

# BST API
* Insert: O(log n)
* Find: O(log n)
* Delete: O(log n)

Note: Implement in code.  
Why is the API on average O(log n) ?
What is the worst case of a BST? Why?  How do we get it to O(log n)? AVL Tree (self balancing)

---

# When is a binary tree balanced?

Note:
What constitutes balanced, unbalanced?

---

<img src="https://i1.wp.com/algorithms.tutorialhorizon.com/files/2014/09/BalancedTree-Example.png" />

---

## How do we determine if a BST is balanced?

<img src="https://3.bp.blogspot.com/-_5dGQOgIIl4/WXOmiP9nbrI/AAAAAAAAbAM/O6meBNN_nZ8TdsgG0feDr54rk4s6xjUoACLcBGAs/s1600/balance-between-neet-and-board.png"/>

Note:
Implement in code

---

## BSTs and Arrays
How do we turn a BST into a sorted array?

<img style='background-color: cadetblue;' src="http://msoe.us/taylor/tutorial/cs2852/bstArray2Tree.png"/>

Note:
Implement in code
What's the time complexity of this operation?

---

# BST FTW!!!
Any Questions?

Note:
Briefly recap the information:
BST: collection of nodes each with max two children. L child is less than parent, right is greater.
API: insert, find, delete
Balanced vs unbalanced
BSTs and sorted arrays.

