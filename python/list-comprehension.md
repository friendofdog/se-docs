List Comprehension
==================

List comprehension is a shorthand way of creating a list. It does the same thing that could be accomplished with `list()` or a `for` loop, but is more consise.

The syntax is `x for x in list`.

```
string = [hello]
mylist = [letter for letter in string]
# ['h','e','l','l','o']
```

Items in this loop can also be operated on.

```
somelist = [num*2 for num in range(5)]
# [0,2,4,6,8]
```

Can also use if statements.

```
anotherlist = [num for num in range(5) if num%2 === 0]
# [0,2,4]
```
