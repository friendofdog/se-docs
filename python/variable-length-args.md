Variable-length Arguments
=========================

When a variable name in a function definition is preceeded by a `*` or `**`, it will use any number of arguments supplied when the function is called.

Arguments (\*args)
------------------

Arguments are passed to the function as a list or tuple. They are interpreted as a tuple within the function.

```python
def return_sum(*nums):
    print(nums) # -> (2, 3)
    return sum(nums)

print(return_sum(2, 3)) # -> 5
```

Keyword arguments (\**kwargs)
-----------------------------

Keyword arguments use dictionaries instead of tuples / lists. Values are associated with keys; it does not matter the order they are passed in. Below is an example of passing keyword arguments using named arguments.

```python
def identify_produce(**produce):
    if 'fruit' in produce:
        print(f'This is a {produce["fruit"]}.')

identify_produce(fruit='apple', veggie='carrot')
```

You could also use the `get()` method to the same effect:

```python
def identify_produce(**produce):
    fruit = produce.get('fruit')
    if fruit:
        print(f'This is a {fruit}.')
```

It is also possible to pass a dictionary as keyword parameters. Below is an example of instantiating a class using a dictionary. Notice that this is useful in falling back on default values.

```python
class ProduceList:
    def __init__(self, **produce):
        self.fruit = produce.get('fruit', 'no fruits')
        self.veggie = produce.get('veggie', 'no veggies')

produce_dict = {'fruit': 'apple'}
produce_list = ProduceList(**produce_dict)
print(produce_list.fruit) # -> 'apple'
print(produce_list.veggie) # -> 'no veggies'
```

Combined usage
--------------

It is possible to use the \*args and \*kwargs in combination with each other.

```python
def myfunc(**food,*quantities):
    print(f'I would like {quantities[0]} {food["fruit"]}')

myfunc(fruit='apple',veggie='carrot',1,2,3)
```

Sources
-------

- https://www.w3schools.com/python/gloss_python_function_arbitrary_keyword_arguments.asp
- https://treyhunner.com/2018/04/keyword-arguments-in-python/
