## Behavioral

* Tell me about yourself
* What three things are you working on to improve your overall effectiveness?
* You have been assigned to a project in a new technology you haven’t worked with before. How do you get started? Have you ever done this before? How did it go?

## Easy

Given an array of length N, with integer values between 0 and N (not including 0 or N), return any integer that appears in the array more than once, i.e. 

```
[ 1, 2, 3, 3, 4 ] => 3
[ 3, 1, 2, 2, 5, 5 ] => 2 or 5 (either is fine)
[ 0, 1, 2 ] => invalid input (can’t have 0)
```
### Time and Space Complexity

* O(n) time
* Easy: O(n) space
* Hard: O(1) space

### Solution

For each number (K), multiply the value at index K by -1. If the value at that index is already negative, that is the duplicate value.

```
[ 3, 1, 1, 2 ] => [ 3, 1, 1, -2 ]
[ 3, 1, 1, -2 ] => [ 3, -1, 1, -2 ]
[ 3, -1, 1, -2 ] => [ 3, -1, 1, -2 ] => return 1
```

## Medium

Given a binary tree, return all root-to-leaf paths.
For example, given the following binary tree:

```
  1
 /   \
2     3
 \
  5
```

All root-to-leaf paths are: ```["1->2->5", "1->3"]```

### Solution

```javascript
var binaryTreePaths = function(root) {
    var paths = [];
    if(!root) return [];
    if(root.left == null && root.right == null){
        if(paths.length == 0) return [""+root.val];
        else return root.val;
    } 
    else{
        if(root.left) 
          binaryTreePaths(root.left).forEach(function(lp) {
            paths.push(root.val + "->" + lp);
          });
        if(root.right) 
          binaryTreePaths(root.right).forEach(function(rp) {
            paths.push(root.val + "->" + rp);
          });
    }

    return paths;
};
```

## Hard

Given a string s, find the longest palindromic substring in s.

Example:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.

Example:
Input: "cbbd"
Output: "bb"

### Solutions

#### Non-optimal Solution - best case ```O(N)```, worst case ```O(N^2)```

This is a non optimal (see below for optimal solution), but much easier to understand solution.
It uses the following algorithm. At a position of the string, it compares the character at the left and right to see if they're the same. If they are, it looks one character further out on each side and compares them. And so on until it reaches an end of the string or finds the two characters are different. 
It does this at each position of the string, finding the longest palindrome centered around each position, keeping track of which is longest overall.

```ruby
def find_longest_palindrome(s)  
  longest = ""  
  0.upto s.length do |i|  
   odd = palindrome_at_position(s, i, i)  
   longest = odd if odd.length > longest.size  
   # handle even length palindromes  
   even = palindrome_at_position(s, i, i+1)  
   longest = even if even.length > longest.size  
  end  
  longest  
 end
 
 def palindrome_at_position(s, left, right)  
  palindrome = ""  
  while (right < s.length &&  
      left >= 0 &&  
      s[left] == s[right])  
   palindrome = s[left,(right-left+1)]  
   left -= 1  
   right += 1  
  end  
  palindrome   
 end  
```

#### Optimal Solution - Linear time O(n)

Here is a linear time solution. Guaranteed to be 2N or fewer comparisons.

This solution is similar to the first solution but it uses findings from previous palindrome length calculations to reduce how much processing it has to do.
It takes advantage of the fact that if you know there is a large palindrome centered around one character, the characters to the immediate right of that character must be at the center of palindromes at least as long as the palindromes centered around characters to the immediate left.

Example: ```"abcbcbadef"```
When you're looking at the 'b' at index 3, you calculate that it's the center of a palindrome 7 characters long (spanning out 3 characters in each direction). So when you go to calculate the palindrome centered around index 4 (the second 'c'), you know that it must be at least as long as the palindrome you've already calculated at index 2 (the first 'c') which is 3 characters long. 
And seeing that those 3 characters don't take you past the end of the palindrome centered around 'b' at index 3, you know that it can only be 3 characters long. And similarly when you look at index 5 (the third 'b'), you know that its palindrome must be the same as the palindrome at index 1 (the first 'b'), which is only 1 character long.

```ruby
def longest_palindrome(str)  
  palindrome_lengths = {}  
  center = right = 0  
  # This gsub changes a string "abc" into "~a~b~c~" 
  # This is done to avoid the problem of even length palindromes    
  processed_str = str.gsub(/(\w|$)/, '~\1')  
  0.upto (processed_str.length - 1) do |i|  
    i_mirror = center - (i - center)  
    if (right > i)  
      palindrome_lengths[i] = [right-i, palindrome_lengths[i_mirror]].min  
    else  
      palindrome_lengths[i] = 0  
    end
    while (processed_str[i + 1 + palindrome_lengths[i]] == processed_str[i - 1 - palindrome_lengths[i]])
      palindrome_lengths[i] += 1
    end
    if (i + palindrome_lengths[i] > right)  
      center = i;  
      right = center + palindrome_lengths[i];  
    end  
  end  
  max = palindrome_lengths.values.max  
  center_index = palindrome_lengths.key(max)  
  str[(center_index - max)/2, max]  
end
```
