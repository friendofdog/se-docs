\*args and \**kwargs
===================

When a variable name in a function definition is preceeded by a `*` or `**`, it will use any number of arguments supplied when the function is called.

\*args
-----

Arguments are passed to the function as a list or tuple. They are interpreted as a tuple within the function.

```
def somefunc(*qwer):
    print(qwer)
    # prints (2,3)
    return sum(qwer)

print(somefunc(2,3))
# returns '5'
```

\**kwargs (keyword arguments)
----------------------------

Like `*args`, except it works with dictionaries instead of tuples / lists. Thus, a dictionary must be passed as an argument when the function is called.

```
def anotherfunc(**asdf):
    if 'fruit' in asdf:
        print(f'This is a {asdf["fruit"]}.')

anotherfunc(fruit='apple',veggie='carrot')
```

-------------

It is possible to use the \*args and \*kwargs in combination with each other.

```
def myfunc(**food,*quantities):
    print(f'I would like {quantities[0]} {food["fruit"]}')

myfunc(fruit='apple',veggie='carrot',1,2,3)
```
