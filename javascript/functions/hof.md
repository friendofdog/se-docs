Higher-Order Functions
======================

`map()`, `filter()`, and `reduce()`
-----------------------------------

These three [standard built-in objects](./javascript/sbo.md) are "essential" HOFs for array manipulation.

The examples below show these methods at work using lambda expressions. They can just as easily use callback functions in lieu of what follows the arrow.

### `Array.map()`

Applies an expression to a given array, returning an entirely new array while not modifying the original.

```javascript
const someNums = [1, 2, 3, 4, 5]
const incremented = someNums.map(n => n + 1)
console.log(incremented)  // → [2, 3, 4, 5, 6]
```

### `Array.filter()`

Applies an expression to a given array, returning an array containing each item which evaluated truthy for the expression.

```javascript
const someNums = [1, 2, 3, 4, 5]
const greaterThanTwo = someNums.filter(n => n > 2)
console.log(greaterThanTwo)  // → [3, 4, 5]
```

### `Array.reduce()`

Applies an expression to a given array, reducing all items to a single value based on how the expression evaluates.

```javascript
const someNums = [1, 2, 3, 4, 5]
const addedUp = someNums.reduce((a, b) => a + b)
console.log(addedUp)  // → 15
```

Sources
-------

- https://jst.hashnode.dev/javascript-higher-order-functions-map-filter-and-reduce
