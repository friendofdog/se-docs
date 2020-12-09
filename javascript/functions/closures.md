Closures
========

> Closure is created when an inner function has access to its outer function variables and arguments. The inner function has access to –
> 1. Its own variables.
> 2. Outer function's variables and arguments.
> 3. Global variables.


```javascript
function wrapValue(n) {
  let local = n;
  return (m) => local * m;  // returns a function, not an evaluation of n * m
}

let wrap1 = wrapValue(1);
let wrap2 = wrapValue(2);
console.log(wrap1(3))  // calls function returned by wrapValue(); → 3
console.log(wrap2(4))  // calls function returned by wrapValue(); → 8
```

Sources
-------

- https://eloquentjavascript.net/03_functions.html#h_hOd+yVxaku
- https://www.freecodecamp.org/news/javascript-closure-tutorial-with-js-closure-example-code/
