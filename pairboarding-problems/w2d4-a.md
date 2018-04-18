# Partner A asks partner B

## Problem 1

### Problem: Jewels and Stones

You are given two strings, `J` and `S`. String `J` represents the types of stones that are jewels. String `S` represents all of the stones that you have. Each character in string `S` is a type of stone you have. You want to know how many of your stones are _also_ jewels.

**Contraints**

* The letters in `J` are guraranteed distinct.
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

If your partner took this approach, ask them to consider the following:

* **Q:** What is the time complexity of this implementation?  
* **A:** If we have a string of stones of size `N`, and a string of jewels of size `K`, this algorithm would be `O(N * K)`
> **Why? For every stone in our collection `S`, we are calling `includes` on the string `J`. Includes is an O(K) operation, happening N times.**

How can we improve this algorithm?

### Better Solution

**The Idea:** First, create a store (a POJO) with the jewels as keys, and some value (`true` or `1`, for example). Then, iterate through `allStones` to check if that key exists in the store (meaning it is a jewel).

```js
function numJewels(jewels, allStones) {
  let count = 0;
  let store = {};

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

In a 2 dimensional array grid, each value `grid[i][j]` represents the height of a building located there. You may think of the grid as a square city from a bird's eye view. Example:

```js
const grid = [
  [2, 3, 9, 7],
  [1, 4, 5, 4],
  [6, 0, 2, 8],
  [4, 1, 7, 7],
];
```

We are allowed to increase the height of any number of buildings, by any amount (the amounts can be different for different buildings). Height 0 is considered to be a building as well.

At the end, the "skyline" when viewed from all four directions of the grid, i.e. top, bottom, left, and right, must be the same as the skyline of the original grid. A city's skyline is the outer contour of the rectangles formed by all the buildings when viewed from a distance. For the `grid` example above, the skyline from the **south** would be `6, 4, 9, 8`. From the **west**: `9, 5, 8, 7`.

What is the maximum total sum that the height of the buildings can be increased?

**Example**:

```
Input: grid = [
  [3,0,8,4],
  [2,4,5,7],
  [9,2,6,3],
  [0,3,1,0]
]

Output: 35
```

**Explanation**:

The skyline viewed from top or bottom is: [9, 4, 8, 7]
The skyline viewed from left or right is: [8, 7, 9, 3]

The grid after increasing the height of buildings without affecting skylines is:

```
gridNew = [
  [8, 4, 8, 7],
  [7, 4, 7, 7],
  [9, 4, 8, 7],
  [3, 3, 3, 3]
]
```

**Constraints:**

* `1 < grid.length ``
* `grid[0].length <= 50.`
* All heights `grid[i][j]` are in the range [0, 100].
* All buildings in `grid[i][j]` occupy the entire grid cell: that is, they are a `1 x 1 x grid[i][j]` rectangular prism.

## Solution
