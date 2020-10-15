Attributes and Methods
======================

Attributes
----------

Class attributes (pieces of information specific to a class) can be either _class_ or _instance_ attributes. Regardless of the type, they are accessible only through the class.

Note that class attributes are not passed in the class name declaration. For example, you would not see `class Dog(name="Doge")`.

### Class attributes

A.k.a. "class object attributes". These are attributes which will always apply to a class, regardless of how it is initiated. The syntax for declaring a class attribute looks similar to variable assignment, but in fact has nothing to do with variables.

A class attribute can be referenced either on `self` or on the class name.

```python
class Dog():

    species = 'mammal'

    def get_info(self):
        print(f"A dog is a {self.species}")
        print(f"A dog is a {Dog.species}")
```

### Instance attributes

These are attributes which are specific to an instance of a class. They are declared using the `__init__` method ([see below](#__init__-method)).

```python
class Dog():

    def __init__(self,name="Doge"):
        self.name = name
```

Methods
-------

Functions inside a class call are called "methods". They are defined inside the body of the enclosing class and are (typically) used to perform operations using the attributes of the class.

### \_\_init\_\_ method

`__init__` can be thought of as a constructor for the class. It creates an instance of the class and is automatically called.

The `self` keyword represents the instance of the object. Attributes can be attached to the class by attaching them to self: `self.attr = 'abcd'`. (`self` can technically be any variable name you want, but conventionally it should be "self".)

```python
class SomeClass():

    def __init__(self, param1, param2):
        self.param1 = param1
        self.param2 = param2

    def some_method(self):
        print(self.param1)
```

### Non-\_\_init\_\_ methods

Class methods need to be evoked on the class. It is the exact same thing as evoking a function on a build-in object (like a list or string).

```python
class Dog():

    def __init__(self,name):
        self.name = name

    def bark(self,number):
        print(f"{self.name} says woof {number} times!")

some_dog = Dog('Doge')
some_dog.bark(4)
```

Another more complex example:

```python
class Account:
    def __init__(self,name,num):
        self.owner = name
        self.balance = num

    def __str__(self):
        return f"{self.owner} has {self.balance} in account"

    def deposit(self,num):
        self.balance += num
        print(f"New balance: {self.balance}")

    def withdraw(self,num):
        if self.balance - num <0:
            return f"Withdraw exceeds current balance, {self.balance}"
        else:
            self.balance -= num
            print(f"New balance: {self.balance}")
```

Sources
-------

- https://dzone.com/articles/python-class-attributes-vs-instance-attributes
