## Behavioral

* Tell me about a time when you had a disagreement with other programmer. How did you handle the situation? Were you able to reach a mutually beneficial resolution to that conflict? If not, why were you and your co-worker unable to reach a mutually beneficial resolution? If you knew then what you know now, what would you have done differently to either prevent the conflict, or to resolve it?

* What is a new technology you are especially excited about?

* Give me an example of a time you had to take a creative and unusual approach to solve coding problem. How did this idea come to your mind? Why do you think it was unusual?

# Question 1
## Second Largest Node

Write an algorithm that, given a Binary Search Tree, will find the second largest node in the tree. Assume you already have a bst `Node` class with an insert method.

**Example:**
```
        _10_
      _/    \_          
     5        15
    / \       / \
   3   8     12  20
  /     \         \
 2       4        30

Output: 20


     10
    /  
   5
  / \
 3   7

Output: 7
```

# Solution

If there is no right node, the second largest is the right most left subtree:
```
   10
   /  
  5
 / \
3   7
```

If there is a right node and the right node has children, recurse to that right child:
```
        _10_
      _/    \_          
     5        15
    / \       / \
   3   8     12  20
  /     \         \
 2       4        30
```
Eventually we'll get to the following scenario:
```
 20
  \
   30
```
If the right node has no children, the second largest is the current node.

Complexity:

Time: O(h)
Space: O(h), where h is the height of the tree


```js
function findSecondLargest(head) {
  if (head.right) {
    if (head.right.left || head.right.right)
      return findSecondLargest(head.right)
    else
      return head;
  } else {
    return findRightMostNode(head.left);
  }
}

function findRightMostNode(node) {
  if (node.right) {
    return findRightMostNode(node.right);
  } else {
    return node;
  }
}
```


# Question 2
## Backwards Addition

Write a method that adds two numbers where the digits are store inside of a linked list in reverse order. The return value should also be a linked list in reverse order.

**Example:**

```
Input 1: 6->5->null
Input 2: 9->8->7
Result: 5->4->8

56 + 789 = 548
```

## Solution

We could solve this with an iterative or a recursive algorithm, both are well suited for this exercise. We'll use a recursive algorithm for practice with recursion. Note this takes an extra space of O(m) where m is the recursion depth.

Base case:
* If first and second lists are null AND carry is zero
  * Return null

Recursive case:
* Set value to carry
* Add both nodes' data to value
* Set the carry to 1 if value >= 10, else 0
* Set the remainder to value % 10
* Create a node with the remainder
* Set node.next to a recursive call on the next nodes, passing in the carry
* Return node

Complexity:

Time: O(n)
Space: O(m), extra space for result and recursion depth

**Notes**:

* Careful with adding if the lists differ
  * Only add if a node is not None
  * Alternatively, we could add trailing zeroes to the smaller list

```ruby
class Node
  attr_reader :data
  attr_accessor :next

  def initialize(data, next = nil)
    @data = data
    @next = next
  end
end

def add_reverse(first_node, second_node, carry)
  if first_node.nil? && second_node.nil? && carry.zero?
    return nil
  end

  value = carry
  value += first_node.nil? 0 : first_node.data
  value += second_node.nil? 0 : second_node.data

  carry = value >= 10 ? 1 : 0

  value %= 10
  node = Node.new(value)
  node.next = add_reverse(first_node&.next, second_node&.next, carry)

  return node 
end
```
