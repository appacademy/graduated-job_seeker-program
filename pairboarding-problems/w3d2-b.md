# Question \#1
## Find Missing Number

You are given an **unsorted** array, and are told that this array contains (n - 1) of n consecutive numbers (where the bounds are defined). Write a method, `findMissingNumber`, that finds the missing number in `O(N)` time

**Example:**
```js
// arrayOfIntegers: [2, 5, 1, 4, 9, 6, 3, 7];
// upperBound: 9;
// lowerBound: 1;

findMissingNumber(arrayOfIntegers, upperBound, lowerBound); // Output: 8
```

## Solution

```js
function findMissingNumber(array, upperBound, lowerBound) {
  // Iterate through array to find the sum of the numbers
  let sumOfIntegers = 0;
  for (let i = 0; i < array.length; i++) {
    sumOfIntegers += array[i];
  }

  // Find theoretical sum of the consecutive numbers using a variation of Gauss Sum.
  // Formula: [(N * (N + 1)) / 2] - [(M * (M - 1)) / 2];
  // N is the upper bound and M is the lower bound

  const upperLimitSum = (upperBound * (upperBound + 1)) / 2;
  const lowerLimitSum = (lowerBound * (lowerBound - 1)) / 2;

  const theoreticalSum = upperLimitSum - lowerLimitSum;

  return theoreticalSum - sumOfIntegers;
}
```

# Question \#2
## Magic Index

The `magic index` of an array occurs when the element at that index is the same as the index itself. More simply, the magic index is when `array[i] === i`. Write a **recursive** method, `findMagicIndex`, that takes in an array and returns the `index` that is the magic index. **The method must take `O(logN)` time and `O(logN)` space.**

**Constraints:**
* The array is sorted
* The array may have **multiple magic indices**. If this is the case, return the **leftmost** occurance.
* The elements in the array have to be distinct
* The magic index doesn't always exist; return `-1` if it doesn't exist
* The array may have negative values

**Examples:**

```
a[i]  -4, -2, 2, 4, 5, 6, 7, 10
i      0,  1, 2, 3, 4, 5, 6, 7
Result: 2

a[i]  -4 -2  -1  0  1  4  6 10
  i    0  1   2  3  4  5  6  7
Result: 6

a[i]  -4 -2  -1  0  1  2  7 10
  i    0  1   2  3  4  5  6  7
Result: -1
```

If your partner gets stuck, ask them: What an algorithm can run in `O(logN)` time, what does that generally mean we must be doing?
> The answer we are looking for here is `splitting it in half`

## Solution

```js
function findMagicIndex(array, start = 0, end = array.length - 1) {
  // if the start or end are out of the array bounds,
  // or the start and end are on the wrong side of each other
  if (start < 0 || array.length <= end || end < start)
    return -1;

  const index = Math.floor((start + end) / 2);
  const item = array[index];

  // rule out left or right half
  // if current index is at or to left of item,
  // then the magic index cannot be in right half
  if (index <= item) {
    // search to the left of index for a magic index
    const left = findMagicIndex(array, start, index - 1);
    if (0 <= left) {
      return left;
    }
    if (index === item) {
      return index;
    }
    // magic index cannot be in right half
    return -1;
  } else {
    // magic index must be in right half, if it exists
    return findMagicIndex(array, index + 1, end);
  }
}
```

**Explanation:**

We'll use a binary search to split the search space in half on each
recursion.

For each change of 1 in `index`, `item` must change by at least 1.  If
`i < array[i]`, then `k < array[k]` for all `i <= k`.  Therefore, `k
!= array[k]` for all `k >= i`.  The magic index, if it exists, cannot
be in the right half.

Steps:
* Check if we hit a contradiction, stop searching and return -1.
  * `start` or `end` might be out of bounds.
  * There might be no `index` left to check such that `start <= index
    <= end`.
* Calculate current `index` to inspect in the middle of `start` and
  `end`, and what retrieve the `item` at that `index`.
* Determine wheter the magic index (if it exists) must be in the left
  half, or right half.
  * If it must be in left half,
    * Look for the left most occurence of a magic index.
    * If there's a magic index to the left, stop looking and return
      that
    * If the current spot is a magic index, return that.
    * Otherwise, there is no magic index, return -1 to indicate that.
  * Otherwise, search the right half of the array.

**Complexity:**
Time: O(log(n))
Space: O(log(n))
