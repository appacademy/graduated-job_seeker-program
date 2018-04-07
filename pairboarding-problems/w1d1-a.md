## Easy

Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.

The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.

### Example 1:

```
Input: "UD"
Output: true
Example 2:
Input: "LL"
Output: false
```

### Solution

```ruby
def judge_circle(moves)
  x = 0
  y = 0
  moves.each_char do |move|
    case move
    when "U"
      y += 1
    when "D"
      y -= 1
    when "R"
      x += 1
    when "L"
      x -= 1
    end
  end
  return x === 0 && y === 0
end
```

## Medium

A self-dividing number is a number that is divisible by every digit it contains. For example, 128 is a self-dividing number because ```128 % 1 == 0, 128 % 2 == 0```,and ```128 % 8 == 0```.

Also, a self-dividing number is not allowed to contain the digit zero.

Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.

### Example 1

Input: left = 1, right = 22
Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]

## Hard

In a 2 dimensional array grid, each value ```grid[i][j]``` represents the height of a building located there. We are allowed to increase the height of any number of buildings, by any amount (the amounts can be different for different buildings). Height 0 is considered to be a building as well. 

At the end, the "skyline" when viewed from all four directions of the grid, i.e. top, bottom, left, and right, must be the same as the skyline of the original grid. A city's skyline is the outer contour of the rectangles formed by all the buildings when viewed from a distance. See the following example.

What is the maximum total sum that the height of the buildings can be increased?

### Example

Input: grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
Output: 35

### Explanation

The grid is:
```
[ [3, 0, 8, 4], 
  [2, 4, 5, 7],
  [9, 2, 6, 3],
  [0, 3, 1, 0] ]
```

The skyline viewed from top or bottom is: ```[9, 4, 8, 7]```
The skyline viewed from left or right is: ```[8, 7, 9, 3]```

The grid after increasing the height of buildings without affecting skylines is:

```
gridNew = [ [8, 4, 8, 7],
            [7, 4, 7, 7],
            [9, 4, 8, 7],
            [3, 3, 3, 3] ]
```

### Solution

For grid[i][j], it can’t be higher than the maximun of its row nor the maximum of its col.
So the maximum increasing height for a building at (i, j) is min(row[i], col[j]) - grid[i][j]

#### Code

row: maximum for every row
col: maximum for every col

The first loop of grid calculate maximum for every row and every col

The second loop calculate the maximum increasing height for every building

#### Time Complexity

```O(N^2)```

```C++
   int maxIncreaseKeepingSkyline(vector<vector<int>>& grid) {
        int n = grid.size();
        vector<int> col(n, 0), row(n, 0);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                row[i] = max(row[i], grid[i][j]);
                col[j] = max(col[j], grid[i][j]);
            }
        }
        int res = 0;
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                res += min(row[i], col[j]) - grid[i][j];
        return res;
    }
```
```java
   public int maxIncreaseKeepingSkyline(int[][] grid) {
        int n = grid.length;
        int[] col = new int[n], row = new int[n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                row[i] = Math.max(row[i], grid[i][j]);
                col[j] = Math.max(col[j], grid[i][j]);
            }
        }
        int res = 0;
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                res += Math.min(row[i], col[j]) - grid[i][j];
        return res;
    }
```
```python
   def maxIncreaseKeepingSkyline(self, grid):
        row, col = map(max, grid), map(max, zip(*grid))
        return sum(min(i, j) for i in row for j in col) - sum(map(sum, grid))
```