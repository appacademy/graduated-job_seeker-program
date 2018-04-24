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
* The elements in the array don't have to be distinct
* The magic index doesn't always exist; return `-1` if it doesn't exist
* The array may have negative values

**Examples:**

```
a[i]  -4, -2, 2, 6, 6, 6, 6, 10
i      0,  1, 2, 3, 4, 5, 6, 7
Result: 2

a[i]  -4 -2  1  6  6  6  6 10
  i    0  1  2  3  4  5  6  7
Result: 6

a[i]  -4 -2  1  6  6  6  7 10
  i    0  1  2  3  4  5  6  7
Result: -1
```

If your partner gets stuck, ask them: What an algorithm can run in `O(logN)` time, what does that generally mean we must be doing?
> The answer we are looking for here is `splitting it in half`

## Solution

```js
function findMagicIndex(array, start, end) {
  if (end < start || start < 0 || end >= array.length)
    return -1;

  const mid = Math.floor((start + end) / 2);

  if (mid === array[mid])
    return mid;

  const leftEnd = Math.min(mid - 1, array[mid]);
  const leftResult = findMagicIndex(array, start, leftEnd);

  if (leftResult !== -1)
    return leftResult;

  const rightStart = Math.max(mid + 1, array[mid]);
  const rightResult = findMagicIndex(array, rightStart, end);

  if (rightResult !== -1)
    return rightResult;

  return -1;
}
```

**Explanation:**

We'll use a binary search to split the search space in half on each iteration. To obtain more efficiency, we can do a little better than a naive left and half split.

In the example below, we see that `i == 5` cannot be the magic index, otherwise a[5] would have to equal 5 (note a[4] == 6).

```
a[i]  -4 -2  2  6  6  6  6 10
  i    0  1  1  3  4  5  6  7
                  mid
```

Similarly, in the example below we can further trim the left search space.

```
a[i]  -4 -2  2  2  2  6  6 10
  i    0  1  2  3  4  5  6  7
                  mid
```
Steps:
* Calculate mid
* If mid == array[mid], return mid
* Recurse on the left side of the array
  * start: 0
  * end: min(mid-1, array[mid]
* Recurse on the right side of the array
  * start: max(mid+1, array[mid]
  * end: end

**Complexity:**
Time: O(log(n))
Space: O(log(n))
