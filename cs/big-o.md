Big O notation
==============

Big O describes the complexity of code using an algebraic expression. It consists of several classifications, which represent how run time increases as input size grows.

Typically, Big O assumes a worst-case scenario. It is approximate in that it tells you the maximum amount of time (upper limit) required for inputs of a given size.

<img src="https://github.com/friendofdog/se-docs/raw/master/img/big-o.jpg" width=500>

Classifications
---------------

### O(1): constant

No matter the size of the input, the time complexity will remain the same.

e.g. lookup table

```python
def findFirstInArray(arr):
  return arr[0]
```

### O(log n): logarithmic

The ratio of the number of operations to the size of the input decreases and tends to zero when `n` increases. Time complexity is about on par with `O(n)` for with smaller inputs, but is more efficient with larger inputs.

e.g. binary search

```python
def findIndexBinary(arr, num):
    low = 0
    high = len(arr) - 1
    mid = 0
 
    while low <= high:
      mid = (high + low) // 2
      if arr[mid] < num:
        low = mid + 1
      elif arr[mid] > num:
        high = mid - 1
      else:
        return mid

    return -1
```

### O(n): linear

Time complexity increases linearly to the size of the input. For every increase of 1 in input size, time complexity increases by 1.

e.g. simple search

```python
def findIndexSimple(arr, num):
  index = 0
  length = len(arr) - 1

  while index <= length:
    if arr[index] == num
      return index
  
  return -1
```

### O(n log n): linearithmic / log linear

This applies to a set of data which is divided using a time complexity of `O(log n)` and then merged using a sub-algorithm with a complexity of `O(n)`. This includes merge srot, heap sort, and quick sort.

e.g. merge sort

```python
def sortArrayMerge(arr):
  if len(arr) > 1:
    mid = len(arr)//2
    left = arr[:mid]
    right = arr[mid:]
    sortArrayMerge(left)
    sortArrayMerge(right)

    i = j = k = 0

    while i < len(left) and j < len(right):
      if left[i] < right[j]:
        arr[k] = left[i]
        i += 1
      else:
        arr[k] = right[j]
        j += 1
      k += 1

    while i < len(left):
      arr[k] = left[i]
      i += 1
      k += 1

    while j < len(right):
      arr[k] = right[j]
      j += 1
      k += 1
    
    return arr
```

### O(n²): quadratic

Time complexity increases by a factor of the square of the input. A typical instance of this would be a loop within a loop.

e.g. selection sort

```python
def sortArraySelection(arr):
  for i in range(len(arr)):
    ind = i
    for j in range(i+1, len(arr)):
      if arr[ind] > arr[j]:
        ind = j
    arr[i], arr[ind] = arr[ind], arr[i]
  return arr
```

### O(2ⁿ): exponential

Time complexity growth doubles with each additon to the input data set.

E.g. double recursive search

```python
def fibonacci(num):
  if num <= 1
    return num
  return fibonacci(num - 2) + fibonacci(num - 1)
```

### O(n!): factorial

Time complexity is the product of all positive integers less than or equal to n. To map a few out:

```
| n | time |
|---|------|
| 0 | 1    |
| 1 | 1    |
| 2 | 2    |
| 3 | 6    |
| 4 | 24   |
| 5 | 120  |
```

e.g. recursive call in for loop

```python
def factorialRuntime(num):
  for i in range(num):
    factorialRuntime(i - 1)
```

Sources
-------

- https://en.wikipedia.org/wiki/big_o_notation
- https://www.freecodecamp.org/news/big-o-notation-explained-with-examples/
- https://jarednielsen.com/big-o-factorial-time-complexity/