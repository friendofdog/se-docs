List Manipulation
=================

Slice
-----

```
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

Append and remove
-----------------

```
list = ['a','b','c','d','e']

list.append('f')
# ['a','b','c','d','e','f']

list.pop()
# ['a','b','c','d']

list.pop(2)
# ['a','b',d','e']
```

Sort
----

```
list = ['d','b','a','c','e']
list.sort()
# ['a','b','c','d','e']

list = ['a','b','c','d','e']
list.reverse()
# ['e','d','c','b','a']
```
