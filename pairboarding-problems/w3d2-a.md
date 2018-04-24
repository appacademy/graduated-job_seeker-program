# Question \#1
## Silly Sum

Write a method, `sillySum`, that takes in a sequence of digits as a string and returns the sum of all digits that match the **_next_** digit in the list. The list is "circular", so the digit after the last digit is the *first* digit in the list.

**Examples:**

- `1122` produces a sum of `3` (`1` + `2`) because the first digit (`1`) matches the second digit and the third digit (`2`) matches the fourth digit.
- `1111` produces `4` because each digit (all `1`) matches the next digit.
- `1234` produces `0` because no digit matches the next.
- `91212129` produces `9` because the only digit that matches the next one is the last digit, `9`.

Your solution should run in `O(logN)` time and take up `O(1)` extra space.

## Solution

```js
function sillySum(digits) {
  let sum = 0;

  for (let i = 0; i < digits.length; i++) {
    if (digits[i] === string[(i + 1) % string.length])
      sum += parseInt(string[i]);
  }

  return sum;
}
```

# Question \#2
## Checksum

You are given a 2D array of random integers. Your goal is to calculate the `checksum` of these integers. For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all these differences.

**Examples:**

```
[
 [5, 1, 9, 5],
 [7, 3],
 [2, 6, 8]
]
```

* The first row's largest and smallest values are `9` and `1`, and their difference is `8`
* The second row's largest and smallest values are `7` and `3`, and their difference is `4`
* The third row's difference is `6`
* The total `checksum` of this input would be `8 + 4 + 6 = 18`

**This method should take `O(N * K)` time, where N is the number if integers in each row, and K is the number of rows. It should take O(1) extra space**

## Solution

```js

function checksum(matrix) {
  let totalSum = 0;

  matrix.forEach(row => {
    let min = row[0], max = row[0];

    row.forEach(int => {
      if (int < min) min = int;
      if (int > max) max = int;
    })

    totalSum += max - min;
  })

  return totalSum;
}
```

# Question \#3
## Queues From Stacks

Implement a Queue using two Stacks. Assume you already have a `Stack` class with the appropriate methods: `push`, `pop`, `peek`, `isEmpty`, and `size`. Create a class, `StackQueue`, that implements this. Your `StackQueue` should function through two primary methods, `enqueue` and `dequeue`. However, feel free to write any additional helper methods that you see fit.

**Constraints:**

* `enqueue`: `O(1)`
* `dequeue:` `O(N)`, but `O(1)` amortized

## Solution

**Overview:**
* We instantiate our `StackQueue` with two stacks, left and right.
* The goal is to **always** dequeue from the right stack, and always enqueue on the left stack
* If the right stack is empty, that means we have to flip the left stack into the right one
  * We can implement a helper method, `flipStacks`, that calls pops every element from the left stack _onto_ the right stack until the left stack is empty  

```js
class StackQueue {
  constructor() {
    this.leftStack = new Stack();
    this.rightStack = new Stack();
  }

  flipStacks() {
    while (!this.leftStack.isEmpty()) {
      this.rightStack.push(this.leftStack.pop());
    }
  }

  enqueue(data) {
    this.leftStack.push(data);
  }

  dequeue() {
    if (this.rightStack.isEmpty())
      this.flipStacks();

    return this.rightStack.pop();
  }
}
```

**Takeaway Question:**
* What is amortization? Why does the `dequeue` method _amortize_ to `O(1)`?
> Amortization means that, over time, our `dequeue` method will **average out** to be `O(1)`. This happens because, even though `flipStacks` is `O(N)`, it gives us `N` free `O(1)` operations.
