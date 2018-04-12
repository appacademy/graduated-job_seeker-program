## Behavioral Questions

* Tell me about yourself by walking me through your resume.
* What was your biggest failure? The answer should tell the interviewer the following:
  * What was the context for the situation that led to the failure?
  * What lead up to the failure?
  * What, specifically, was the failure?
  * How did you recover from this failure? What was the eventual outcome?

## Trivia

* [What is the event loop?](https://hackernoon.com/understanding-js-the-event-loop-959beae3ac40)
* [What are some of your favorite features of ES6?](https://webapplog.com/es6/)

## `merge_sort`

Implement merge sort.

### Solution 

```ruby
def merge_sort(array)
  # already sorted
  return array if array.count < 2

  middle = array.count / 2
  left, right = array.take(middle), array.drop(middle)

  sorted_left, sorted_right = merge_sort(left), merge_sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged_array = []
  until left.empty? || right.empty?
    merged_array <<
      ((left.first < right.first) ? (left.shift) : (right.shift))
  end

  merged_array + left + right
end
```

Time complexity: `O(n*log(n))`.

```ruby
def merge(left, right)
  merged_array = []
  i, j = 0, 0
  until i == left.length || j == right.length
    if left[i] > right[j]
      merged_array << right[j]
      j += 1
    else
      merged_array << left[i]
        i += 1
    end
  end
  merged_array + left.drop(i) + right.drop(j)
end
```

Time complexity for merge only: `O(n)`.

## Matchsticks

You have two sticks and a matchbox. Each stick takes exactly an hour
to burn from one end to the other.

The sticks are weird, in that they do not burn at a steady. If you
break a stick in half, it is not guaranteed that each half will take
30min to burn.

How would you measure exactly 45 minutes by burning these sticks?

### Solution

Take stick1, light it at both ends. At the same time, light stick2 at
one end.

When stick1 is extinguished, 30min have passed. Now, light stick2 at
the other end. The stick will take another 15min to finish burning.

## `duplicates` (from LeanData)

Write a method that takes an array and returns its duplicate values. Use less than O(n*n) time.

```ruby
 def duplicates(arr)
   values = Set.new
   copies = Set.new

   arr.each do |value|
    if values.include?(value)
     copies << value
    else
     values << value
    end
   end

   return copies
end
```

In this solution, we use sets. Because sets have `O(1)` lookup time, we solve the problem in a time complexity of `O(n)`.

## `choose_a_record` (also LeanData)

Write a method that takes a hash of symbol keys, for which the values are integers representing each key's weight. The method returns a key such that the chances of selecting a particular key are weighted by that key's value.

For the hash {:a => 1, :b => 2, :c => 3}, the chance of returning :c is 1/2, :b is 1/3, and :a is 1/6.

### Solution

```ruby
def key_chance(hash)
  total = hash.values.inject(&:+)
  selection = rand(total)

  sum = 0
  hash.each do |k, v|
    sum += v
    if selection < sum
      return k
    end
  end
end
```

In this solution, we start by finding the total of the hash's values. We can then generate a random number from (0...total). We then iterate back through our hash, keeping track of a sum along the way. If our selection falls below the sum at any point, we are in the portion of the hash and return the key.

