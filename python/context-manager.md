Context Managers
================

A context manager allows you to allocate and release resources at runtime. This allows for automatic setup (such as returning an initiated object or closing) and teardown (such as closing an open file).

The `with` statement
--------------------

Context managers are most commonly used with the `with` statement. For example, the below opens a file and will automatically release the associated resources when the code block finishes.

```python
with open("some-document.txt") as f:    
    data = f.read()
    print(data)
```

This is the equivalent of the following:

```python
f = open("some-document.txt")
try:
    data = f.read()
    print(data)
finally:
    f.close()
```

Implementing as a class
-----------------------

A class can be instantiated with a context manager much like it would be with a variable assignment. Two built-in methods will always be present: `__enter__()` for setup and `__exit__(exc_type, exc_val, exc_tb)` for teardown.

`__enter__` takes no additional arguments besides `self`, but `__exit__` has three: `exc_type`, `exc_val`, `exc_tb`. If the runtime context exits due to an exception, these parameters describe what caused this to happen. Otherwise, their value is `None`.

Here is a class which can be used with a context manager. In this example, `__exit__` includes simple error handling.

```python
class File(object):
    def __init__(self, file_name, method):
        self.file_obj = open(file_name, method)
    def __enter__(self):
        return self.file_obj
    def __exit__(self, type, value, traceback):
      print("Exception has been handled")
      self.file_obj.close()  # should be here regardless of error handling
      return True
```

A context manager operating on this object would look very similar to the first example:

```python
with File("some-document.txt", "r") as f:    
    data = f.read()
    print(data)
```

contextlib
----------

Because an object needs at least the built-in types `__enter__` and `__exit__` to be used as a context manager, some objects cannot be used as such on their own. In these situations, the decorator `@contextlib.contextmanager` defines a factory function without explicitly defining a class with `__enter__` and `__exit__`.

For example:

```python
import contextlib

@contextlib.contextmanager
def open_the_file(path):
    f = open(path)
    try:
        data = f.read()
        yield data
    finally:
        f.close()

with open_the_file("some-document.txt") as file_data:
    print(file_data)
```

Sources
-------

- https://book.pythontips.com/en/latest/context_managers.html
- https://docs.python.org/3/reference/datamodel.html#context-managers
- https://www.geeksforgeeks.org/context-manager-in-python/
- https://docs.python.org/3/library/stdtypes.html#typecontextmanager
- https://docs.python.org/3/library/contextlib.html
