# Partner B asks Partner A

## Problem 1

### Isomorphic Strings

**Overview:** For two strings to be isomorphic, all occurrences of a character in string `A` can be replaced with another character
to get string `B`. The order of the characters must be preserved. There must be one-to-one mapping for every char of
string A to every char of string B.

`paper` and `title` would return true.
`egg` and `sad` would return false.
`dgg` and `add` would return true.

```js
isIsomorphic("egg", 'add'); // true
isIsomorphic("paper", 'title'); // true
isIsomorphic("kick", 'side'); // false
```

### Solution

```js
function isIsomorphic(firstString, secondString) {

  // Check if the same lenght. If not, they cannot be isomorphic
  if (firstString.length !== secondString.length) return false

  const letterMap = {};

  for (let i = 0; i < firstString.length; i++) {
    let letterA = firstString[i],
        letterB = secondString[i];

    // If the letter does not exist, create a map and map it to the value
    // of the second letter
    if (letterMap[letterA] === undefined) {
      letterMap[letterA] = letterB;
    } else if (letterMap[letterA] !== letterB) {
      // Eles if letterA already exists in the map, but it does not map to
      // letterB, that means that A is mapping to more than one letter.
      return false;
    }
  }
  // If after iterating through and conditions are satisfied, return true.
  // They are isomorphic
  return true;
}
```

## Balanced Parentheses

**Overview:** Write a method, `isBalanced`, that will **use a stack** to evaluate if a given expression has balanced parentheses.

**Example:**
```
Input: "(())()()"

Output: True
```

```
Input: "()(())"

Output: False
```


**Before we get started:**

First, ask your partner to go over a basic API for a `Stack`. It should follow the following constraints:

* It takes 1 argument in the constructor, `store`, that defaults to an empty array
* It should have the following methods:
  * `pop()`: removes and returns last element from the store
  * `push()`: adds element to the end of the store
  * `size()`: returns the size of the store
  * `peek()`: shows the top element of the stack (without removing it)
  * `isEmpty()`: returns `true` or `false` if the stack is empty

Ask your partner to implement a stack. We will use it to solve our ultimate problem. Their implementation should look something like this (if they did it ES6 style):
```js
class Stack {
    constructor(store = []) {
      this.store = store;
    }

    pop() {
      return this.store.pop();
    }

    push(el) {
      this.store.push(el);
    }

    size() {
      return this.store.length;
    }

    peek() {
      return this.store[this.store.length - 1];
    }

    isEmpty() {
      return !this.store.length
    }
}
```

Great! Now ask your partner to implement our `isBalanced` method using our `Stack` class. If they get stuck, you can go over the basic idea with them.

**The Idea:**
* First, we will create a stack. This will only hold our opening parentheses
* Every time we encounter a closing parentheses, we will call `pop()` on our stack
* We know that the string is `unbalanced` in **two scenarios:**
  * If we ever call `pop()` and it returns `undefined`, we know we have called pop on an empty stack
  * If we get through our iteration, and there are still items in our stack, we know they did not match up

```js
function isBalanced(string) {
  const stack = new Stack();

  for (let i = 0; i < string.length; i++) {
    if (string[i] === '(') {
      stack.push(string[i]);
    } else if (string[i] === ')') {

      if (!stack.pop()) return false;
    }
  }

  // If the array is not empty, it is not balanced
  return stack.isEmpty();
}
```
