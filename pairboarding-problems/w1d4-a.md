## Behavioral Questions

* Tell me about yourself. What makes you a good fit for a full stack developer job at Uber?
* What is your greatest weakness as a software developer, and what are you doing to overcome that weakness?

## Trivia

* [What happens when you type in Google.com and hit enter?](https://github.com/alex/what-happens-when)
* [What is a closure in JavaScript?](http://javascriptissexy.com/understand-javascript-closures-with-ease/)

## Non-Comparison Sorts

Part 1: Say that I gave you an array of length `n`, containing the
numbers `1..n` in jumbled order. "Sort" this array in `O(n)` time. You
should be able to do this without looking at the input.

Part 2: Say that I give you an array of length `n` with numbers in the
range `1..N` (`N >= n`). Sort this array in `O(n + N)` time. You may
use `O(N)` memory.

Part 3: Say I give you an array of `n` strings, each of length `k`. I
claim that, using merge sort, you can sort this in `O(knlog(n))`,
since comparing a pair of strings takes `O(k)` time.

I want you to beat that. Sort the strings in `O(kn)`. **Hint**: do not
compare any two strings. You may assume all strings contain only
lowercase letters `a..z` without whitespace or punctuation.

### Solutions

```ruby
def sort1(arr)
  (1..(arr.length)).to_a
end
```
Our first sort is simple - if we have an array of elements from 1 to arr.length, we can simply make a new array using the range `1..arr.length`! No comparisons here!

```ruby
def sort2(arr, max_val)
  counts = Array.new(max_val + 1, 0)
  arr.each { |el| counts[el] += 1 }

  arr = []
  counts.each_index do |val|
    counts[val].times { arr << val }
  end
  arr
end
```

In our second sort, we know that we have n items in our array from the range `1..N`. To solve this in `O(n + N)` time, we can start off with an array of counts of length `N + 1`. We iterate through the array, incrementing the value at the correct index every time we find an item. We then iterate through the counts array and add the correct number of elements into our final ordered results array.

```ruby
def sort3(strings, length)
  (length - 1).downto(0) do |i|
    buckets = Array.new(26) { [] }
    strings.each do |string|
      letter = string[i]
      buckets[letter.ord - "a".ord] << string
    end

    strings = []
    buckets.each do |bucket|
      bucket.each { |string| strings << string }
    end
  end

  strings
end
```

Our last sort is a little bit trickier. Our general strategy will be to go through the entire array of strings and sort them into buckets letter by letter, starting with the last (and least significant) letter, then join the buckets together. Once we've done this, we can rest assured that the strings are now sorted by the last letter.

We then move up to the second-to-last letter and do the same, sorting the strings into buckets based on this letter. When we add these strings into buckets based on the second-to-last letter, the order within each bucket will maintain its relative orders based on the last letter, so on and so forth through the string until it is entirely sorted.

Example:
```ruby
sort3([`cat`, `car`, `bat`])

# buckets after sorting by last letter
buckets = [[], ... , [`car`], ..., [`cat`, `bat`],  ...]

# strings after we join the buckets back together, now sorted by last letter
strings = [`car`, `cat`, `bat`]

# buckets after sorting by second to last letter - note that they retain their relative ordering by last letter in the buckets
buckets = [[`car`, `cat`, `bat`], ..., []]

# strings after we join the buckets back together, now sorted by last letter and second-to-last letter
strings = [`car`, `cat`, `bat`]

# lastly, buckets sorted by the first and most important letter
buckets = [[], ..., [`bat`], [`car`, `cat`] ...]

strings = [`bat`, `car`, `cat`]
```

We have a loop that goes through each string `O(n)` nested within a loop that goes through each letter `O(k)` for a total time complexity of `O(n * k)`.

## Remove Duplicates from Sorted Array

Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

### Example

Input: ```[1, 1, 2]```

Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

It doesn't matter what you leave beyond the new length.

### Solution

Since the array is already sorted, we can keep two pointers ```i``` and ```j```, where ```i``` is the slow-runner while ```j``` is the fast-runner. As long as ```nums[i] = nums[j]```, we increment ```j``` to skip the duplicate.

When we encounter ```nums[j] != nums[i]```, the duplicate run has ended so we must copy its value to ```nums[i + 1]```. ```i``` is then incremented and we repeat the same process again until ```j``` reaches the end of array.

```javascript
const removeDuplicates = function(nums) {
    if (nums.length === 0) return 0;
    
    let i = 0;
    
    for (let j = 1; j < nums.length; j++) {
        if (nums[j] !== nums[i]) {
            i++;
            nums[i] = nums[j];
        }
    }
    
    return i + 1;
}
```
