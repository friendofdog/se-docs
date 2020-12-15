Scope
=====

Environments: execution, lexical, variable
------------------------------------------

Closures
--------

[Short summary]

See [closures](./javascript/functions/closures.md) for more details.

Global object
-------------

There is only one global object in JavaScript. In a browser, it is called `window`; in Node it is `global`. All so-called "globals" are actually just properties of this global object. In Node, for example, a global variable called `owner` is actually `global.owner`.

```javascript
// in a browser
var abc = "123"
console.log(abc)  // → 123
console.log(window.abc)  // → 123

// in Node
var def = "456"
console.log(def)  // → 456
console.log(global.def)  // → 456
```

```javascript
"use strict"

function aaa() {
  console.log(this)
}

const bbb = () => {
  console.log(this)
}

aaa()  // → undefined
window.aaa() // → global object

bbb()  // → global object
window.bbb() // → TypeError: window.bbb is not a function
```

```javascript
function aaa() {
  console.log(this)
}

const bbb = () => {
  console.log(this)
}

aaa()  // → global object
window.aaa() // → global object

bbb()  // → global object
window.bbb() // → TypeError: window.bbb is not a function
```

Sources
-------

- https://medium.com/@bdov_/javascript-typescript-execution-vs-lexical-vs-variable-environment-37ff3f264831
