## High Score
(Question and solution taken from Interview Cake)
You've created an extremely popular game. You rank players in the game from highest to lowest score. So far you're using an algorithm that sorts in O(nlogn) time, but players are complaining that their rankings aren't updated fast enough. You need a faster sorting algorithm.

Write a function that takes:
* an array of unsorted_scores
* the highest_possible_score in the game

and returns a sorted array of scores in less than O(nlogn) time.

Example (doin't give to interviewee; let them come up with their own inputs and outputs):
```ruby
unsorted_scores = [37, 89, 41, 65, 91, 53]
HIGHEST_POSSIBLE_SCORE = 100

sort_scores(unsorted_scores, HIGHEST_POSSIBLE_SCORE)
# returns [37, 41, 53, 65, 89, 91]
```
Clarification (again, not to be given out to interviewee unless asked for):
* In aiming for nlogn, we define `n` as the number of unsorted_scores because we're expecting the number of players to keep growing.
* We'll treat highest_possible_score as a constant instead of factoring it into our big O time and space costs, because the highest possible score won't change.

**Bonus: If the interviewee finishes early: Our solution returns a separate, sorted array. Could we instead sort the array in place? Does this change the time complexity? The space complexity?**

### Solution
We can build an array score_counts where the indices represent scores and the values represent how many times the score appears. Once we have that, we can generate a sorted array of the scores.

```ruby
def sort_scores(unsorted_scores, highest_possible_score)

  # array of 0s at indices 0..highest_possible_score
  score_counts = [0] * (highest_possible_score+1)

  # populate score_counts
  unsorted_scores.each do |score|
      score_counts[score] += 1
  end

  # populate the final sorted array
  sorted_scores = []

  # for each item in score_counts
  score_counts.each_with_index do |count, score|

      # for the number of times the item occurs
      (0...count).each do |time|

          # add it to the sorted array
          sorted_scores.push(score)
      end
  end

  return sorted_scores
end
```

#### Complexity
O(n) time and space.

Even though the solution has a nested loop towards the end, notice what those loops iterate over. The outer loop runs once for each unique number in the array. The inner loop runs once for each time that number occurred.

So in essence we're just looping through the n numbers from our input array, except we're splitting it into two steps: (1) each unique number, and (2) each time that number appeared.
Here's another way to think about it: in each iteration of our two nested loops, we append one item to sorted_scores. How many numbers end up in sorted_scores in the end? Exactly how many were in our input array, n,

#### Takeaways
Counting is a common pattern in time-saving algorithms. It can often get you O(n) runtime, but at the expense of adding O(n) space. In an interview, being able to talk through these trade-offs and considerations will earn you brownie points with the interviewer.

## Roman Numerals

### (Part 1)
Given an integer between 1-3999, convert it to a roman numeral.

### (Part 2)
Given a roman numeral between 1-3999, convert it to an integer.


### Solution

Part 1

```ruby
def intToRoman(num)
  m = ["", "M", "MM", "MMM"]
  c = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  x = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  i = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  m[num/1000] + c[(num%1000)/100] + x[(num%100)/10] + i[num%10]
end

p intToRoman(1916) == 'MCMXVI'
```

Part 2

```ruby
def romanToInt(string)
  roman = {'M'=> 1000,'D'=> 500 ,'C'=> 100,'L'=> 50,'X'=> 10,'V'=> 5,'I'=> 1}
  result = 0
  (string.length - 1).times do |i|
    if roman[string[i]] < roman[string[i+1]]
      result -= roman[string[i]]
    else
      result += roman[string[i]]
    end
  end
  result + roman[string[-1]]
end

p romanToInt('MCMXVI') == 1916

```
