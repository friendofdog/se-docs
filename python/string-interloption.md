String Interpolation
====================

Two ways to interpolate strings:

1. `.format()` (old method)
2. `f-strings` (newer method)

.format() method
----------------

Can be done with or without using variables:

`print('My name is {}.'.format('Guy'))`

`print('My name is {n}.'.format(n='Guy'))`

### Float formatting

The syntax looks like this:

`{value:width.precision f}`

Where...
- value is the variable
- width allows you to add white space
- precision is decimal limit to display, followed by `f`

For example,

```
num = 100/777
print('100 divided by 777 is {n:1.10f}.'.format(num))
```
evaluates to `100 divided by 777 is 0.1287001287.`

You can create a sort of table using white space:

```
print('{0:8} | {1:8}'.format('Fruit', 'Quantity'))
print('{0:8} | {1:8}'.format('Apples', 3.))
print('{0:8} | {1:8}'.format('Oranges', 10))
```

```
Fruit    | Quantity
Apples   |      3.0
Oranges  |       10
```

f-strings method
----------------

Does the same thing as `.format()` but has simpler syntax.

```
n = 'Guy'
print(f'My name is {n}.')
```

Example with float formatting:

```
num = 100/777
print(f'100 divided by 777 is {num:1.10f}.')
```
