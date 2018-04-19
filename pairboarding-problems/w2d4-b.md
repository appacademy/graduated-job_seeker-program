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
This problem should be completed in O(N) time and O(N) space.

### Solution


```js
function isIsomorphic(firstString, secondString) {

  // Check if the same length. If not, they cannot be isomorphic
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
      // If letterA already exists in the map, but it does not map to
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

**Overview:** Write a method, `isBalanced`, that will evaluate if a given expression has balanced parentheses.

**Example:**
```
Input: "(())()()"

Output: True
```

```
Input: "()())"

Output: False
```

> **Hint:** If your partner gets stuck, ask them if using a stack might help us.
What would happen if every time we saw an **opening** parenthesis, we put it on the stack, and every time we saw a closing parenthesis, we called pop on our stack? When would we know if our parentheses weren't matching up?

### Solution \#1

* First, we will create a stack using an Array. This will only hold our _opening_ parentheses
* Every time we encounter a closing parentheses, we will call `pop()` on our stack
* We know that the string is `unbalanced` in **two scenarios:**
  * If we ever call `pop()` and it returns `undefined`, we know we have called pop on an empty stack
  * If we get through our iteration, and our stack is not empty, we know they did not match up

```js
function isBalanced(string) {
  const stack = [];]

  for (let i = 0; i < string.length; i++) {
    if (string[i] === '(') {
      stack.push(string[i]);
    } else if (string[i] === ')') {
      if (!stack.pop()) return false;
    }
  }

  // If the array is not empty, it is not balanced
  return !stack.length;
}
```

What is the time complexity of this approach? What is the space complexity?

> Given a string of length `N`, we have to do one full iteration which is `O(N)`. We then create a stack of size N / 2, which makes it `O(N)` space.

**Unfortunately, we are really strapped for space. Can you think of a similar way to solve this problem that is O(1) space?**

### Solution \#2

Instead of using a stack, we could use a counter. Every time we encounter an opening parenthesis, we increment our counter.

The logic is very similar to using a stack. If we encounter a closing parenthesis, we decrement our count. If our count falls below `0`, we know we have encountered an unbalanced amount of parantheses. Additionally, if the count is not `0` after the iteration, we have not encountered enough closing parentheses.

```js
function isBalanced(string) {
  let count = 0;

  for (let i = 0; i < string.length; i++) {
    if (string[i] === '(') {
      count += 1;
    } else if (string[i] === ')') {
      count -= 1;

      if (count < 0) return false;
    }
  }

  return !count;
}
```
