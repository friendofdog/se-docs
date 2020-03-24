Lambda Expressions
=================

Also known as "anonymous function", lambda expressions are unnamed functions which you only use once.

Strictly speaking, lambda functions differ from regular ones only in syntax. `def square(num): return num**2` is the same as `lambda num: num**2`. Note that `return` is not used.

The typical use case for a lambda expression is in conjunction with other functions. For example, `map()` and `filter()` as below.

```
list(map(lambda num: num**2, [1,2,3,4,5]))
# returns [1, 4, 9, 16, 25]
```

```
list(filter(lambda num: num%2 == 0, [1,2,3,4,5]))
# returns [2,4]
```
