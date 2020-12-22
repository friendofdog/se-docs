Arrays
======

Arrays in JavaScript are ordered lists. They use integer indexes which can be accessed using bracket notation.

Arrays are mutable, meaning its state can be altered after it is created.

Iterating over arrays
---------------------

`forEach()` iterates over an array, calling a callback function on every element. There is no "natural" way to break out of a `forEach()` loop; it will just keep going until the transversal is complete.

It takes three arguments: the element's value, the element's index, and the array.

```javascript
const somelist = [1, 2, 3, 4, 5]

somelist.forEach((x, i, arr) => {
  console.log(`${x} is at position ${i} in ${arr}`)
})
```

`for ... in` is a conventional way for iterating over an array. Being a `for` loop, it can be broken out of using `break` and iterations can be skipped using `continue`.

```javascript
for (let i = 0; i = somelist.length; i++) {
  console.log(`${somelist[i]} is at position ${i} in ${somelist}`)
}
```

Adding, removing elements
-------------------------

`push()`: add element to end of array

`unshift()`: add element to beginning of array

`pop()`: remove element from end of array; return that element

`shift()`: remove element from beginning of array; return that element

`splice(index, deleteCount, ...elements)`: deletes `deleteCount` number of elements at index `index` and inserts `elements` at there

```javascript
somelist.splice(1, 3, "a", "b", "c")  // → [ 1, 'a', 'b', 'c', 5 ]
```

Searching arrays
----------------

`includes(element)`: returns `true` if array includes `element`

Copying arrays
--------------

`slice(start[, end])`: make a copy of an array starting from position `start` and ending at the optional position `end` – but not including the element at position `end`
