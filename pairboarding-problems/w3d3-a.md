# Triple Maximum

Given an array of integers, find the largest product yielded from three of the integers.

**Examples:**

```js
maxOfThree([10, 3, 5, 6, 20]) // Output: 1200. Multiply 10, 6, 20

maxOfThree([-10, -3, -5, -6, -20]) // Output: -90

maxOfThree([1, -4, 3, -6, 7, 0]) // Output: 168
```

**Hints:**
* Remind your partner that you cannot simply take the max three numbers, as two negative numbers make a positive number
* We do not want our algorithm to _check_ for negative numbers or take absolute values

## Naive Solution (Not Accepted)

One naive solution would be `O(n^3)` time and `O(1)` space. It involves simply doing 3 nested loops and checking every possible combination of 3 numbers. That may look something like this:

```js
function maxOfThree(arr) {
  let maxProduct = arr[0] * arr[1] * arr[2];

  for (let i = 0; i < arr.length - 2; i++) {
    for (let j = i + 1; j < arr.length - 1; j++) {
      for (let k = j + 1; k < arr.length; k++) {
        const potentialProduct = arr[i] * arr[j] * arr[k];

        maxProduct = Math.max(maxProduct, potentialProduct);
      }
    }
  }

  return maxProduct;
}
```

This is an inefficient implementation. How can we do better?

## Solution

1. Scan the array and compute Maximum, second maximum and third maximum element present in the array.
2. Scan the array and compute minimum and second minimum element present in the array.
3. Return the maximum of product of max1, max2, and max3 and product of max1, min1, min2

The reason we use this approach is because we have to account for negative numbers. Our max product will _either_ be from the 3 max numbers, or will be from the max number and the 2 minimum numbers (if they are negative).

```js
function maxOfThree(array) {
  // Set up out variables. It's ok if we simply set them all to the first element of the array.
  let max1 = array[0], max2 = array[0], max3 = array[0];
  let min1 = arr[0], min2 = arr[0];

  for (let i = 0; i < array.length; i++) {
    // Handle updating maximum
    if (array[i] > max1) {
      // if this is true, we must update *all* maximum variables, essentially shifting them all down 1.
      max3 = max2;
      max2 = max1;
      max1 = array[i];
    } else if (arr[i] > max2) {
      // Same idea...
      max3 = max2;
      max2 = array[i];
    } else if (array[i] > max3) {
      max3 = array[i];
    }

    // Handle updating minimum
    if (array[i] < min1) {
      min2 = min1;
      min1 = array[i];
    } else if (array[i] < min2) {
      min2 = array[i];
    }
  }

  return Math.max(max1 * max2 * max2, max1 * min1 * min2);
}
```
