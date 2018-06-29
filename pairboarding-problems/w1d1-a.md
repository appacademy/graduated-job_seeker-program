## Behavioral

* Tell me about yourself
* What are some of your professional development goals?
* Tell me about a goal that you set that took a long time to achieve or that you are still working towards. How do you keep focused on the goal given the other priorities you have?

## Easy

Initially, there is a Robot at position (0, 0). Given a sequence of its moves, judge if this robot makes a circle, which means it moves back to the original place.

The move sequence is represented by a string. And each move is represent by a character. The valid robot moves are R (Right), L (Left), U (Up) and D (down). The output should be true or false representing whether the robot makes a circle.

### Example

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

### Example

* Input: ```left = 1, right = 22```
* Output: ```[1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]```

### Solution

For each number in the given range, we will directly test if that number is self-dividing.

By definition, we want to test each whether each digit is non-zero and divides the number. For example, with 128, we want to test ```d != 0 && 128 % d == 0``` for ```d = 1, 2, 8```. To do that, we need to iterate over each digit of the number.

A straightforward approach to that problem would be to convert the number into a character array (string in Python), and then convert back to integer to perform the modulo operation when checking n % d == 0.

We could also continually divide the number by 10 and peek at the last digit. That is shown as a variation in a comment.

```ruby
def self_dividing_number(left, right)
  result = []
  i = left

  while i <= right
    str = i.to_s
    j = 0
    c = 0

    while j < str.length
      if str[j].to_i == 0
        break
      elsif i % str[j].to_i == 0
        c+=1
      end

      j+=1
    end

    if c == str.length
      result.push(i)
    end

    i+=1
  end
  return result
end
```

### Time complexity: ```O(D)```, where D is the number of integers in the range [left, right]

## Hard

In a 2 dimensional array grid, each value ```grid[i][j]``` represents the height of a building located there. We are allowed to increase the height of any number of buildings, by any amount (the amounts can be different for different buildings). Height 0 is considered to be a building as well. 

At the end, the "skyline" when viewed from all four directions of the grid, i.e. top, bottom, left, and right, must be the same as the skyline of the original grid. A city's skyline is the outer contour of the rectangles formed by all the buildings when viewed from a distance. See the following example.

What is the maximum total sum that the height of the buildings can be increased?

### Example

* Input: ```grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]```
* Output: ```35```

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

For ```grid[i][j]```, it can’t be higher than the maximun of its row nor the maximum of its col.
So the maximum increasing height for a building at (i, j) is ```min(row[i], col[j]) - grid[i][j]```

#### Code

row: maximum for every row
col: maximum for every col

The first loop of grid calculate maximum for every row and every col

The second loop calculate the maximum increasing height for every building

#### Time Complexity

```O(N^2)```

```javascript
const maxIncreaseKeepingSkyline = grid => {
    const maxXArr = [];
    const maxYArr = [];
    const length = grid.length;
    let maxIncrease = 0;
    
    for (let i = 0; i < length; ++i) {
        let rowMax = 0;
        let colMax = 0;
        
        for (let j = 0; j < length; ++j) {
            const row = grid[i][j];
            const col = grid[j][i];
            
            rowMax = row > rowMax ? row : rowMax;
            colMax = col > colMax ? col : colMax;
        }
        
        maxXArr.push(rowMax);
        maxYArr.push(colMax);
    }
    
    for (let i = 0; i < length * length; ++i) {
        const x = i % length;
        const y = Math.floor(i / length);
        
        const minMaxHeight = Math.min(maxXArr[y], maxYArr[x]);
        
        maxIncrease += minHeight - grid[x][y];
    }
    
    return maxIncrease;
};
```
