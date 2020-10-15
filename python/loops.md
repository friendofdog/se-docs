Loops
=====

For loops
---------

### Iterating with `_`

If you do not want to utilise the items in a list, it is common practice to use `_` to iterate:

```python
for _ in 'Hello world':
  print('Iterating over anonymous letter')
```

### Tuple unpacking

Tuples inside a list can be unpacked while looping through the containing list:

```python
e = [(1,2),(3,4),('cat','dog')]
for a,b in e:
    print(a,b)
```

### Dictionary loop

You can access keys and values (and both) in a dictionary by using the fuctions `items()`, `keys()`, and `values()`.

```python
d = {'one':10,'two':'b','three':0.5}

# displays keys and values
for k,v in d.items():
    print(k,v)

# displays keys only
for k in d.keys():
    print(k)

# displays keys only
for v in d.values():
    print(v)
```

While loops
-----------

### Break

Ends closest enclosing loop, ending it entirely.

### Continue

Jumps to next iteration. Goes back to top of closest enclosing loop.

### Pass

Is basically just a placeholder when you want a loop but don't want it to do anything. Useful to avoid syntax error in empty iteration.

Useful functions
----------------

`range(begin,length,step)` creates a length which can be iterated over.

```python
for num in range(0,11,2):
    print(num)
    # 0
    # 2
    # 4
    # ...etc
```

`list()` generates a list, which can then be put into a loop.

`enumerate()` gives every item in a list an index. Items become tuples, with index being at position 0.

```python
for index, letter in enumerate('somestring'):
    print(index, letter)
```

`zip()` zips together two or more lists (like a zipper on a jacket).

```python
list1 = [1,2,3]
list2 = ['a','b','c']

for item in zip(list1,list2):
    print(item)
    # (1,'a')
    # (2,'b')
    # (3,'c')
```

`in` checks if something exists in a list or dictionary. Useful to avoid errors.

Check for letter in strong:

```python
'd' in 'dog'
# True
```

Check for key in dictionary:

```python
'key' in {'key':123}
# True
```

Check for value in dictionary:

```python
d = {'somekey':345}

345 in d.values()
# True
```

`min()` and `max()` respectively check for minimum and maximum values in a list.
