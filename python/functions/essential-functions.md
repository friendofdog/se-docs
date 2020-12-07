Essential Built-in Functions
============================

Manipulating iterables
----------------------

### `zip(*iterables)`

Returns a `zip()` object with an iterator of tuples where `i` tuple contains `i` of each given iterable. Ignores where `i` is not present in each iterable.

```python
>>> products = ['table', 'chair', 'sofa', 'bed', 'lamp', 'desk']
>>> prices = [50, 20, 200, 150, 10]
>>> print(zip(products, prices))
<zip object at 0x104554b40>
>>> print(list(zip(products, prices)))
[('table', 50), ('chair', 20), ('sofa', 200), ('bed', 150), ('lamp', 10)]
>>> print(list(zip(products, prices)))
{'table': 50, 'chair': 20, 'sofa': 200, 'bed': 150, 'lamp': 10}
```

### `map(function, iterable, ...)`

Returns a `map()` object which results from applying the given callback function to the iterable. One iterable is required; any additional iterables become arguments to the callback function.

The below examples use lambda functions, but normal `def someFunc()` functions can be used as callbacks as well.

```python
>>> aaa = map(lambda x: x + 1, [1,2,3])
>>> print(list(aaa))
[2, 3, 4]
>>> bbb = map(lambda x, y: x + y, [1,2,3], [4,5,6])
>>> print(list(bbb))
[5, 7, 9]
>>> ccc = map(lambda x, y: x + y, [1,2,3], [3])
>>> print(list(ccc))
[4]
```

### `filter(function, iterable)`

Returns a `filter()` object containing elements from the iterable which evaluate to `True` if applied as arguments to the function.

```python
>>> oddNums = filter(lambda x: x % 2, [1,2,3,4,5])
>>> print(list(oddNums))
[1, 3, 5]
```

Interacting with environment
----------------------------

### `input()`

### `open()`

Interacting with objects
------------------------

### `isinstance(object, (type))`

Returns `True` if object is of the specified type. The type can be a single value or a tuple. If a tuple, will return true if *any* of the specified type apply to the object.

```python
>>> print(isinstance(4, int))
True
>>> print(isinstance([1,2,3], (list, float)))
True
```

### `id(object)`

Returns the integer ID of an object. This ID is constant throughout the lifetime of the object. Note that the ID does not pertain to variables which point to objects; it pertains to the object itself.

```python
>>> print(id("abc"))
4532515504
>>> aaa = "abc"
>>> print(id(aaa))
4532515504
>>> bbb = aaa
>>> print(id(bbb))
4532515504
```

Changing data forms
-------------------

### hex(integer)

### bin(integer)

### format(value[, format_spec])

Sources
-------

- https://docs.python.org/3/library/functions.html
- https://towardsdatascience.com/10-python-built-in-functions-you-should-know-f6beba1698bb
