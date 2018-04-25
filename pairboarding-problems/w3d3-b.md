# Intersecting Arrays

Find the intersection of two arrays. An intersection would be the common elements that exists within both arrays. In this case, these elements should be unique!

**Example:**

```js
const firstArray = [2, 2, 4, 1];
const secondArray = [1, 2, 0, 2];

intersection(firstArray, secondArray); // Output: [2, 1]
```

## Solution

This solution takes `O(n)` time and `O(n)` space.

The logic here is to create a hashmap with the elements of the firstArray as the keys.
After that, you can use the hashmap's O(1) look up time to check if the element exists in the hash
If it does exist, add that element to the new array.

```js
function intersection(firstArray, secondArray) {

  const letterStore = {};
  const intersectionArray = [];

  firstArray.forEach(element => letterStore[element] = 1);

  // Since we only want to push unique elements in our case... we can implement a counter to keep track of what we already added
  secondArray.forEach((element) => {
    if (letterStore[element] === 1) {
      intersectionArray.push(element);
      letterStore[element]++;
    }
  });

  return intersectionArray;
}
```

# Largest Difference

Given an array of integers, find the largest difference between two elements such that the element of lesser value must come before the greater element. **Complete this problem in `O(n)` time**.

**Examples:**

```js
findLargestDifference([1, 6, 5, 2, 9, -2])

// Output is 8 based on the difference between 1 and 9. Note: It is not 11 from 9 and -2 because 9 comes before -2.
```

## Solution

```js
function findLargestDifference(array) {
  // If there is only one element, there is no difference
  if (array.length <= 1) return -1;

  // currentMin will keep track of the current lowest
  let currentMin = array[0];
  let currentMaxDifference = 0;

  // We will iterate through the array and keep track of the current max difference
  // If we find a greater max difference, we will set the current max difference to that variable
  // Keep track of the current min as we iterate through the array, since we know the greatest
  // difference is yield from `largest value in future` - `smallest value before it`

  for (let i = 1; i < array.length; i++) {
    if (array[i] > currentMin && (array[i] - currentMin > currentMaxDifference)) {
      currentMaxDifference = array[i] - currentMin;
    } else if (array[i] <= currentMin) {
      currentMin = array[i];
    }
  }

  // If negative or 0, there is no largest difference
  if (currentMaxDifference <= 0) return -1;

  return currentMaxDifference;
}
```
