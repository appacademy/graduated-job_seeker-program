## Behavioral

* Describe a situation in which you met a major obstacle in order to complete a project. How did you deal with it? What steps did you take?
* Tell me about a time you had to work on several projects at once. How did you handle this?
* Give an example of a time when you didn’t agree with other programmer. Did you stand up for something that you believed was right?

## Question 1
### Reverse a Linked List

You are given the pointer to the head node of a linked list. Your goal is to reverse this list. A linked list is implemented using just a `Node` class, which you will be given. The `Node` class is defined as:

```js
function Node(data, next = null) {
  this.data = data;
  this.next = next;
}
```

Your function should take in just the **head node**, reverse the list, and return the _new_ head node (which would be the _old_ tail node). Remember that an empty linked list is still a valid linked list. If `null` is passed into your function, your function should return `null`.

Note that this class does not have a `previous` attribute. Make sure your partner is using a Node object similar to the one above!

**Constraints:**

* Your function must run in `O(n)` time and `O(1)` space

### Solution

**Overview:** All we want to do here is flip the `next` attribute on each node until we've gotten to the end. We could do this iteratively with a `while` loop.

```js
function Node(data, next = null) {
  this.data = data;
  this.next = next;
}

function reverse(head) {
  let prev = null;
  let current = head;
  let next;

  while (current !== null) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }

  return prev;
}
```

## Question 2
### Cycle Detective

A linked list is said to contain a cycle if any node is visited more than once while traversing the list.

Complete the function provided for you in your editor. It has one parameter: a pointer to a Node object named `head` that points to the head of a linked list. Your function must return a boolean denoting whether or not there is a cycle in the list. If there is a cycle, return true; otherwise, return false.

**Example:**
```js
const node3 = new Node(3, null);
const node2 = new Node(2, node3);
const node1 = new Node(1, node2);

/* This creates the following list:
   1->2->3->null
*/

detectCycle(node1) // Output: False

const cycleNode3 = new Node(3, null);
const cycleNode2 = new Node(2, cycleNode3);
const cycleNode1 = new Node(1, cycleNode2);

// reassign `next` attribute to create cycle
cycleNode3.next = cycleNode2;

/* Our list now looks like this:
   1->2->3->2->3->2 ... etc.  
*/
hasCycle(node1) // Output: true
```

### Solution 1 - Use Hashing

```js
function hasCycle(head) {
  const seen = {};

  let temp = head;

  while (temp) {
    if (seen[temp]) return true;

    seen[temp] = true;

    temp = temp.next;
  }

  return false;
}
```


Can you do this in O(1) space?

### Solution 2 (Improved)

This is the fastest method. Traverse linked list using two pointers.  Move one pointer by one and other pointer by two.  If these pointers meet at some node then there is a loop.  If pointers do not meet then linked list doesn’t have loop.

```js
function hasCycle(head) {
    let hasCycle = false;

    if (!head)
      hasCycle = false;

    let slow = head;
    let fast = head;

    while (slow && fast) {
        slow = slow.next;
        fast = fast.next.next;

        if (fast == slow) {
            hasCycle = true;
            break;
        }
    }

    return hasCycle;
}
```
