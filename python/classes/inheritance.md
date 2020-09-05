Inheritance
===========

Inheritance is where a new class is created using another class which has already been defined. The child class inherits the properties (attributes, methods) of its parent class, which can be called without re-declaring them in the child.

An inherited method can be overwritten, if so desired. This is done by declaring it in the new class. This is called "method overwriting" and is a kind of polymorphism.

In the context of Python objects, polymorphism is where methods with the same name are used by two different classes. Inheritance is one instance of this. Another instance might be where two otherwise unrelated classes use the same method name. However, more often than not, polymorphism will occur where a child class overwrites a parent class method.


```python
class Animal():

    def __init__(self):
        print("New animal created")

    def who_am_i(self):
        print("I am an animal")

    def eat(self):
        print("Eating")

class Dog(Animal):

    def __init__(self):
        # runs __init__() of Animal
        Animal.__init__(self)
        print("Dog created")

    # overwrites who_am_i() from Animal
    def who_am_i(self):
        print("I am a dog")

dog = Dog()

# evoke eat() inherited from Animal
dog.eat()

# evoke who_am_i() inherited from Animal and overwritten by Dog
dog.who_am_i()
```

`super()` method
----------------

The `super()` method creates an object from the superclass, allowing access to the methods and attributes of that class. This saves you the trouble of having to re-write the name of the superclass throughout the subclass and allows the superclass to be easily swapped.

```python
class Animal():

    def __init__(self, animal):
        print("New animal created:", animal)

class Dog(Animal):

    def __init__(self):
        super().__init__('dog')
```


Sources
-------

- https://overiq.com/python-101/inheritance-and-polymorphism-in-python/
- https://www.geeksforgeeks.org/polymorphism-in-python/
