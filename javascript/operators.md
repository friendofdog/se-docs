Operators
=========

Arithmatic operators
--------------------

- `+` add or concatenate
- `-` subtract
- `*` multiply
- `/` divide
- `%` get remainder of

Comparison operators
--------------------

- `==` equals
- `!=` not equal
- `===` equals (strict)
- `!==` not equal (strict)
- `<` less than
- `>` greater than
- `<=` less than or equal to
- `>=` greater than or equal to

Logical operators
-----------------

- `&&` and
- `||` or
- `!` not (a urinary operator)

### Short-circuit evaluation

`||` returns the left operand if it returns `true`, returning the right operand only if the left is `false`. This means that often the right never gets evaluated, even if it is something very bad. This is called *short-circuit evaluation* (and is one reason why testing is important).

Type coersion
-------------

Type coersion occurs when an operation is performed on a type of value which normally would not work with said operation. JavaScript converts it to the necessary type for the operation to succeed.

Here are a few examples:

```javascript
console.log(8 * null)    // → 0
console.log("5" - 1)     // → 4
console.log("5" + 1)     // → 51
console.log("five" * 2)  // → NaN
console.log(false == 0)  // → true
```

This will not occur with the operators `===` and `!==`, which compare exact values and prevent type conversion.

```javascript
console.log(false === 0)  // → false
console.log("5" !== 5)    // → true
```

Sources
-------

- https://eloquentjavascript.net/01_values.html
