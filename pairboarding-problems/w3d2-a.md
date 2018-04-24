# Question \#1
## Silly Sum

Write a method, `sillySum`, that takes in a sequence of digits as a string and returns the sum of all digits that match the **_next_** digit in the list. The list is "circular", so the digit after the last digit is the **first* digit in the list.

**Examples:**

- `1122` produces a sum of `3` (`1` + `2`) because the first digit (`1`) matches the second digit and the third digit (`2`) matches the fourth digit.
- `1111` produces `4` because each digit (all `1`) matches the fourth digit.
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
