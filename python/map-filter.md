Map and Filter
==============

Map
---

`map(function,[args])` runs every supplied argument through the stated function, returning a list.

```
def square(num):
    return num**2

some_nums = [1,2,3,4,5]
mapped = map(square,some_nums)

print(mapped)
# prints <map at somememorylocation>

print(list(mapped))
# prints squared items
```

Filter
------

`filter(function,[args])` returns whatever args the called function evaluates as `True` or which return a non-`False` value.

```
def checkeven(num):
    return num%2 == 0

list(filter(checkeven,[1,2,3,4,5]))
# returns [2,4]
```
