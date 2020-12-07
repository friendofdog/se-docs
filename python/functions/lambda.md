Lambda Expressions
==================

Lambda expressions are sort of anonymous function which you might use in lieu of a named function.

The syntax for a lambda expression is `lambda arguments : expression`. Strictly speaking, lambda functions differ from regular ones only in syntax. For example,

```python
def square(num):
  return num ** 2
```

is the same as

```python
lambda num: num ** 2
```

Note that `return` is not used. Whatever follows the `:` is what is returned.

As as iffy expression
---------------------

A lambda can be used as an [Immediately Invoked Function Expression](https://developer.mozilla.org/en-US/docs/Glossary/IIFE) by surrounding it in parentheses, like as follows:

```python
(lambda num: num ** 2)(2)  # returns 4

(lambda a, b: a + b)(5, 7)  # returns 12
```

Binding to variables
--------------------

Lambdas can be bound to variables, which results in something much like normal function definition:

```python
square = lambda num: num ** 2
square(2)  # returns 4
```

Using a lambda in this manner is a bit less robust than using a normal function. For example, if an exception occurs the traceback will only show that the exception occured in `<lambda>`, whereas the traceback for a function would give the function name.

With other functions
--------------------

The typical use case for a lambda expression is in conjunction with other functions. For example, below is a lambda used in conjunction with the built-in `map()` and `filter()` functions:

```python
list(map(lambda num: num ** 2, [1, 2, 3, 4, 5]))
# returns [1, 4, 9, 16, 25]
```

```python
list(filter(lambda num: num % 2 == 0, [1, 2, 3, 4, 5]))
# returns [2, 4]
```

Sources
-------

- https://realpython.com/python-lambda/
