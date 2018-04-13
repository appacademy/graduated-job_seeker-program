# Partner A interviews Partner B

## Make Change
Write a function that takes in an amount and a set of coins.  Return the minimum number of coins needed to make change for the given amount.  You may assume you have an unlimited supply of each type of coin. If it's not possible to make change for a given amount, return nil or NaN.

Example:
``` ruby
make_change(14, [10, 7, 1])
# return 2 because [7, 7] is the smallest combination
```

## Solution

### Brute Force Iterative
```ruby
def make_change(amount, coins = [25, 10, 5, 1])
  coins = coins.sort.reverse

  best_change = nil

  (0...coins.count).each do |index|
    change = []
    total = 0
    coins.drop(index).each do |coin|
      until (coin + total) > amount
        change << coin    
        total += coin
      end
    end

    if (best_change.nil? || change.count < best_change.count)
      best_change = change
    end
  end

  return best_change if best_change.nil?
  best_change.count
end
```

### Recursive
Taken from recursion day of main curriculum

```ruby
def make_change(target, coins = [25, 10, 5, 1])
  # Don't need any coins to make 0 cents change
  return [] if target == 0
  # Can't make change if all the coins are too big. This is in case
  # the coins are so weird that there isn't a 1 cent piece.
  return nil if coins.none? { |coin| coin <= target }

  # Optimization: make sure coins are always sorted descending in
  # size. We'll see why later.
  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    # can't use this coin, it's too big
    next if coin > target

    # use this coin
    remainder = target - coin

    # Find the best way to make change with the remainder (recursive
    # call). Why `coins.drop(index)`? This is an optimization. Because
    # we want to avoid double counting; imagine two ways to make
    # change for 6 cents:
    #   (1) first use a nickel, then a penny
    #   (2) first use a penny, then a nickel
    # To avoid double counting, we should require that we use *larger
    # coins first*. This is what `coins.drop(index)` enforces; if we
    # use a smaller coin, we can never go back to using larger coins
    # later.
    best_remainder = make_change(remainder, coins.drop(index))

    # We may not be able to make the remaining amount of change (e.g.,
    # if coins doesn't have a 1cent piece), in which case we shouldn't
    # use this coin.
    next if best_remainder.nil?

    # Otherwise, the best way to make the change **using this coin**,
    # is the best way to make the remainder, plus this one coin.
    this_change = [coin] + best_remainder

    # Is this better than anything we've seen so far?
    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  return best_change if best_change.nil?
  best_change.count
end
```

### Dynamic Programming
Bottom-up implementation, with the variation that we're passing the cache through as we go rather than holding it as an instance variable.

```ruby
def make_change(amt, coins, coin_cache = {0 => 0})
  return coin_cache[amt] if coin_cache[amt]
  coins = coins.sort
  return 0.0/0.0 if amt < coins[0]

  min_change = amt
  way_found = false
  idx = 0
  while idx < coins.length && coins[idx] <= amt
    num_change = 1 + make_change(amt - coins[idx], coins, coin_cache)
    if num_change.is_a?(Integer)
      way_found = true
      min_change = num_change if num_change < min_change
    end
    idx += 1
  end

  if way_found
    coin_cache[amt] = min_change
  else
    coin_cache[amt] = 0.0/0.0
  end
end
```

## Detailed Explanation of mutliple approaches (highly recommended)

https://leetcode.com/articles/coin-change/
