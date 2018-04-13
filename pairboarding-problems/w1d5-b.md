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
