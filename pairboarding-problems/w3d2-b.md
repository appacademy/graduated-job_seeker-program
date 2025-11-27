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

original,
> The `magic index` of an array occurs when the element at that index is the same as the index itself. More simply, the magic index is when `array[i] === i`. Write a **recursive** method, `findMagicIndex`, that takes in an array and returns the `index` that is the magic index. **The method must take `O(logN)` time and `O(logN)` space.**

corrected,
> The `magic index` of an array occurs when the element at that index is the same as the index itself. More simply, the magic index is when `array[i] === i`. Write a **recursive** method, `findMagicIndex`, that takes in an array and returns the `index` that is the magic index. **The method must take `O(*N*)` time and `O(logN)` space.**

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

original,

> If your partner gets stuck, ask them: What an algorithm can run in `O(logN)` time, what does that generally mean we must be doing?
> > The answer we are looking for here is `splitting it in half`

corrected,

> If your partner gets stuck, tell your partner to write a binary
> search algorithm.  The problem is not amenable to binary search as
> written.  But the original author thought it was.

> Bonus: try to come up with a pathological case that forces a linear
> search time given the proposed solution below.

## Solution

```js
function findMagicIndex(array, start = 0, end = array.length - 1) {
  if (end < start || start < 0 || end >= array.length)
    return -1;

  const mid = Math.floor((start + end) / 2);

  if (mid === array[mid])
    return mid;

  // NOTE: nothing prevents searching both the left and right
  // portions of the array.  The extra culling from taking min or max
  // is only a linear efficiency in the worst case scenario.
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

original,

**Explanation:**

original,

> We'll use a binary search to split the search space in half on each iteration. To obtain more efficiency, we can do a little better than a naive left and half split.

corrected,

> We'll use a binary search to split the search space in half on each
> iteration.  To obtain more efficiency, we can do a little better
> than a naive left and half split.  However, the efficiency gain will
> only be constant in the worst case scenario, shrinking the search
> window by 1.

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

original,

Steps:
> * Calculate mid
> * If mid == array[mid], return mid
> * Recurse on the left side of the array
>   * start: 0
>   * end: min(mid-1, array[mid]
> * Recurse on the right side of the array
>   * start: max(mid+1, array[mid**
>   * end: end

NOTE: this algorithm does not return the left most magic index.
consider an array where `array[i] == i`.  this algorithm will return
the middle item, not 0.

## Counter Example disproving O(logN) Runtime

Consider an array where `array[i] == i + 1`, for example, `[1, 2, 3,
4, 5, 6, 7, 8, 9]`.


begin, this is stack frame 0
```
a[i]   1  2  3  4  5  6  7  8  9
  i    0  1  2  3  4  5  6  7  8
mid                ^
start  ^
end                            ^
```

```
start = 0, end = 8, mid = 4, numbers[mid] = 5
start = 0, end = 3, mid = 1, numbers[mid] = 2
start = 0, end = 0, mid = 0, numbers[mid] = 1
start = 0, end = -1, mid = -1, numbers[mid] = 9
start = 1, end = 0, mid = 0, numbers[mid] = 1
start = 2, end = 3, mid = 2, numbers[mid] = 3
start = 2, end = 1, mid = 1, numbers[mid] = 2
start = 3, end = 3, mid = 3, numbers[mid] = 4
start = 3, end = 2, mid = 2, numbers[mid] = 3
start = 4, end = 3, mid = 3, numbers[mid] = 4
start = 5, end = 8, mid = 6, numbers[mid] = 7
start = 5, end = 5, mid = 5, numbers[mid] = 6
start = 5, end = 4, mid = 4, numbers[mid] = 5
start = 6, end = 5, mid = 5, numbers[mid] = 6
start = 7, end = 8, mid = 7, numbers[mid] = 8
start = 7, end = 6, mid = 6, numbers[mid] = 7
start = 8, end = 8, mid = 8, numbers[mid] = 9
start = 8, end = 7, mid = 7, numbers[mid] = 8
start = 9, end = 8, mid = 8, numbers[mid] = 9
```

NOTE we did better than naive going right and shrank the right side by
1 more than with simple `start = index + 1` calculation.
Unfortunately, doing better by 1 still leaves O(N) work to do on the
right side, making the total amount of work O(N).

The given solution would search both left and right halves.  The
improvement on the right half would only shrink the size of the right
half by 1 more than the naive solution.

original,

> **Complexity:**
> Time: O(log(n))
> Space: O(log(n))

corrected,

> **Complexity:**
> Time: O(n)
> Space: O(log(n))
