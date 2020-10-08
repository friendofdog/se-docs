Decorators
==========

A decorator is a function that takes another function and extends the behavior of the latter function without explicitly modifying it. It provides a syntax for calling higher-order functions (a function that takes one or more functions as arguments or which returns a function as its result).

Below is an example of calling a higher-order function, `decorator`, without any special syntax. It is called using another function, `say_hi`, as an argument. (Note that `say_hi` is called without parentheses because it is not being executed; only the reference to it is being passed.)

```python
def greeting_decorator(fn):
    def wrapper(n):
        print("About to greet you")
        return fn(n)
    return wrapper

def say_hi(name):
    return f"Hello there, {name}"

greeting = greeting_decorator(say_hi)
print(greeting('Guy'))
# About to greet you
# Hello there, Guy
```

Using a decorator, the syntax would look like the below. `say_hi` is being passed to `greeting_decorator` as `fn`. The internal method `wrapper` receives the variable, `n`, which was passed in when `say_hi` was called.

The end result is exactly the same as above.

```python
def greeting_decorator(fn):
    def wrapper(n):
        print("About to greet you")
        return fn(n)
    return wrapper

@greeting_decorator
def say_hi(name):
    return f"Hello there, {name}"

print(say_hi('Guy'))
# About to greet you
# Hello there, Guy
```

Although it might look like `say_hi` then receives `n` directly, the decorator has sort of kidnapped this variable for itself. It is only passed to `say_hi` when this function is called as `fn(n)`. The decorator can do whatever it wants with `n`.

In the modified example below, `greeting_decorator` will preface the passed in function with a print statement. `say_hi` will take two arguments. We would expect `say_hi` to return "Hello there, guy" because "guy" is the first positional argument on a function that takes only one argument – but the decorator will get involved and make it return something different.

```python
def greeting_decorator(fn):
    def wrapper(n, g):
        print(f"{n} is about to greet you")
        return fn(g)
    return wrapper

@greeting_decorator
def say_hi(name):
    return f"Hello there, {name}"

print(say_hi('Guy', 'The host'))
# Guy is about to greet you
# Hello there, The host
```

One of the main benefits of decorators is their reusability. The `greeting_decorator` above could decorate any number of functions which take a single argument. But what if you want to decorate any function regardless of how many arguments it took? Include a [variable length argument](./variable-length-args.md).

Below, the `greeting_decorator` takes any number of positional and named arguments. `**kwargs` is used to specify the host, while `*args`, if passed in, are sent to the calling function. `say_hi` now takes `*args` instead of `name` because it could theoretically receive more than one argument (and break). Admittedly, this is a very sloppy use of variable length arguments and would break easily in any real-life situation – especially if any calling function used keyword arguments – but it does go to illustrate how these things are used.

```python
def greeting_decorator(fn):
    def wrapper(*args, **kwargs):
        print(f"{kwargs['host']} is about to greet you")
        return fn(*args)

    return wrapper

@greeting_decorator
def say_hi(*args):
    return f"Hello there, {args[0]}"

@greeting_decorator
def generic_hi():
    return "Hello there"

print(say_hi('Guy', 'blah', 'meh', host='Owner'))
print(generic_hi(host='Maitres de'))
```

Decorators and attributes
-------------------------

A decorated function will take on attributes of the decorator. In the above example, accessing the `__name__` attribute of `say_hi` would return `greeting_decorator`.

```python
print(say_hi.__name__)
# greeting_decorator
```

The `functools` module have a useful decorator, `@functools.wraps`, which preserves the information about the original function.

```python
import functools

def greeting_decorator(fn):
    @functools.wraps(fn)
    def wrapper(*args, **kwargs):
        print(f"{kwargs['host']} is about to greet you")
        return fn(*args)

    return wrapper
```

Decorating classes
------------------

Nesting decorators
------------------

Stateful decorators
-------------------

Classes as decorators
---------------------

`@classmethod` and `@staticmethod`
----------------------------------

Below is a good illustration from a conversation on [Slack channel of Tokyo Python Society](tokyo-python-sc.slack.com).

```python
# @classmethod vs @staticmethod vs "plain" methods
# What's the difference?
class MyClass:
    def method(self):
        """
        Instance methods need a class instance and
        can access the instance through `self`.
        """
        return 'instance method called', self
    @classmethod
    def classmethod(cls):
        """
        Class methods don't need a class instance.
        They can't access the instance (self) but
        they have access to the class itself via `cls`.
        """
        return 'class method called', cls
    @staticmethod
    def staticmethod():
        """
        Static methods don't have access to `cls` or `self`.
        They work like regular functions but belong to
        the class's namespace.
        """
        return 'static method called'
# All methods types can be
# called on a class instance:
>>> obj = MyClass()
>>> obj.method()
('instance method called', <MyClass instance at 0x1019381b8>)
>>> obj.classmethod()
('class method called', <class MyClass at 0x101a2f4c8>)
>>> obj.staticmethod()
'static method called'
# Calling instance methods fails
# if we only have the class object:
>>> MyClass.classmethod()
('class method called', <class MyClass at 0x101a2f4c8>)
>>> MyClass.staticmethod()
'static method called'
>>> MyClass.method()
TypeError:
    "unbound method method() must be called with MyClass "
    "instance as first argument (got nothing instead)"
```

Sources
-------

- https://realpython.com/primer-on-python-decorators
- https://en.wikipedia.org/wiki/Higher-order_function
- https://docs.python.org/3/library/functools.html#functools.wraps
- https://stackabuse.com/pythons-classmethod-and-staticmethod-explained
