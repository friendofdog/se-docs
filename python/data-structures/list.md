List comprehension
------------------

List comprehension is a shorthand way of creating a list. It does the same thing that could be accomplished with `list()` or a `for` loop, but is more consise.

The syntax is `x for x in list`.

```python
string = [hello]
mylist = [letter for letter in string]
# ['h','e','l','l','o']
```

Items in this loop can also be operated on.

```python
somelist = [num*2 for num in range(5)]
# [0,2,4,6,8]
```

Can also use if statements.

```python
anotherlist = [num for num in range(5) if num%2 === 0]
# [0,2,4]
```

List manipulation
-----------------

### Slice

```python
list = ['a','b','c','d','e']

list[0]
# 'a'

list[:2]
# ['a','b']

list[2:]
# ['c','d','e']

list[1:3]
# ['b','c']
```

### Append and remove

```python
list = ['a','b','c','d','e']

list.append('f')
# ['a','b','c','d','e','f']

list.pop()
# ['a','b','c','d']

list.pop(2)
# ['a','b',d','e']
```

### Sort

```python
list = ['d','b','a','c','e']
list.sort()
# ['a','b','c','d','e']

list = ['a','b','c','d','e']
list.reverse()
# ['e','d','c','b','a']
```
