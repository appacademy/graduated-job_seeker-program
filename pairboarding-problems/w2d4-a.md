# Partner A asks partner B

## Problem 1

### Jewels and Stones

You are given two strings, `J` and `S`. String `J` represents the types of stones that are jewels. String `S` represents all of the stones that you have. Each character in string `S` is a type of stone you have. You want to know how many of your stones are _also_ jewels.

**Contraints**

* The letters in `J` are guaranteed distinct.
* All characters in `J` and `S` are letters.
* Letters are case-sensitive, so `"a"` is considered a different type of stone from `"A"`.

### Example 1:

```
Input: J = "aA", S = "aAAbbbb"
Output: 3
```

### Example 2:
```
Input: J = "z", S = "ZZ"
Output: 0
```

### Brute Force Solution

**The Idea:** Initialize a `count` at `0`. Iterate through string `S`; for each character check if it is included in string `J`. If it is included, increment the count. Once iteration has finished, return the count.

```js
function numJewels(jewels, allStones) {
  let count = 0;

  allStones.split('').forEach(stone => {
    if (jewels.includes(stone)) count += 1
  })

  return count;
}
```

**Questions for you partner:**

If your partner took this approach, ask them about the time complexity of this implementation.

* If we have a string of stones of size `N`, and a string of jewels of size `K`, this algorithm would be `O(N * K)`
> **Why? For every stone in our collection `S`, we are calling `includes` on the string `J`. Includes is an O(K) operation, happening N times.**

How can we improve this algorithm?

### Better Solution

**The Idea:** First, create a store (a POJO) with the jewels as keys, and some value (`true` or `1`, for example). Then, iterate through `allStones` to check if that key exists in the store (meaning it is a jewel).

```js
function numJewels(jewels, allStones) {
  let count = 0;
  const store = {};

  for (let i = 0; i < jewels.length; i++) {
    store[jewels[i]] = true;
  }

  for (let j = 0; j < allStones.length; j++) {
    if (store[allStones[j]]) count += 1;
  };

  return count;
}
```

What is the time complexity of this implementation? Why?
> Iterating through `jewels` is O(K). Iterating through `allStones` is O(N). This brings our time complexity to O(N + K).

---

## Problem 2

### Trapping Rain Water

You are given an array of `n` non-negative integers, where each number represents a ground elevation. Each point of elevation has a width of 1. For example, given an array `[5, 2, 4, 3, 1, 4]`, the elevation map would look something like this:
```
 ___
|   |    ___         ___
|   |   |   |___    |   |
|   |___|       |   |   |
|               |___|   |
| 5   2   4   3   1   4 |
```

Our goal is to compute how much water our elevation map would be able to trap if it rained. Referring to the above example, it would look like this if it rained:
```
 ___
|   |,,, ___ ,,,,,,, ___
|   |///|   |///////|   |
|   |///|       |///|   |
|               |///|   |
| 5   2   4   3   1   4 |
```

Thus, for an input of `[5, 2, 4, 3, 1, 4]`, the total sum of water that would be trapped is `6` units.

Write a method, `trappedWater`, that calculates this for you.

**Before your partner begins to write code, talk through the logic of this problem. Lead them to think about what determines how much water a single bar can hold above it.**

The idea is that, at any point, the amount of water it can hold is determined by the _minimum_ of the maximum point to the right and maximum point to the left (`min(maxRight, maxLeft)`). For the above example, the water that `2` can hold is the minimum of `4` (right max) and `5` (left max). The amount of water it can hold above it (`2 units`) is determined by the difference between this min-max and itself (`4 - 2`).

### Brute Force Solution

**Overview:** For each element in the array, we find the maximum level of water it can trap after the rain, which is equal to the minimum of the maximum height of bars on both sides, minus its own height.

```js
function trappedWater(nums) {
  let totalWater = 0;

  for (let i = 1; i < nums.length - 1; i++) {
    let maxLeft = 0, maxRight = 0;

    for (let j = i; j >= 0; j--) {
      maxLeft = Math.max(maxLeft, nums[j]);
    }

    for (let j = i; j < nums.length; j++) {
      maxRight = Math.max(maxRight, nums[j]);
    }

    totalWater += (Math.min(maxLeft, maxRight) - nums[i]);
  }

  return totalWater;
}
```

**Complexity Analysis:** (Ask your partner)

* What is the time complexity? `O(n ^ 2)`. For each element of array, we iterate the left and right parts
* What is the space complexity? `O(1)`

**How can we do this in O(N) time?**

### Efficient Solution

In the brute force solution, we iterate over the left and right parts again and again just to find the highest bar size up to that index. But, this could be stored!

**The Idea:**
* Create two arrays -- one to store the left maximums at each index, and one to store the right maximums at each index
* Instantiate an integer, `totalWater`, which will be returned at the end
* Instantiate a variable, `leftMax`, to be the first element in the array
* Iterate left to right.
  * If the element at the current index is greater than `leftMax`, reassign `leftMax` to that element.
  * Store `leftMax` at that index in our array of left maximums.
* Now, iterate back. Right to left. Instantiate a variable, `rightMax`, that will start as the right-most element.
  * Similar to our first iteration, if the element at the current index is greater than `rightMax`, reassign `rightMax` to be that element
  * Store `rightMax` at that index in our array of _right_ maximums
* Perform one last iteration to find how much water can be held at each index. The steps to find that are:
  * Find the **minimum** of the two maximums for that index, found in our `leftMaxArray` and `rightMaxArray`
  * Find the difference between that minimum and the elevation at the same index
  * Add this difference to our `totalWater` sum.
* Return `totalWater` at the end.

```js
function trappedWater(elevation) {
  let totalWater = 0;

  const rightMaxArray = [];
  const leftMaxArray = [];
  const size = elevation.length

  let leftMax = elevation[0];

  for (let i = 0; i < size; i++) {
    if (elevation[i] > leftMax) leftMax = elevation[i];

    leftMaxArray[i] = leftMax;
  }

  let rightMax = elevation[size - 1];

  for (let i = size - 1; i >= 0; i--) {
    if (elevation[i] > rightMax) rightMax = elevation[i];

    rightMaxArray[i] = rightMax;
  }

  for (let i = 0; i < size; i++) {
    totalWater += Math.min(leftMaxArray[i], rightMaxArray[i]) - elevation[i];
  }

  return totalWater;
}
```
