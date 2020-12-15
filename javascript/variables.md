Variables
=========

`var` vs. `let` vs. `const`
-------------------------

|  | var | let | const |
|-|-|-|-|
| scope | function | block | block |
| re-declare? | yes | no | no |
| re-assign value? | yes | yes | no |
| undefined by default? | yes | no | no |
| initialised when hoisted? | yes | no | no |

### Differences between `var` and `let`

`var` and `let` are similar in that they can both be re-assigned values. However, their scopes are different: `var` is not block-scoped while `let` is.

```javascript
var greeter = "hello"

if (true) {
    var greeter = "goodbye"
}

console.log(greeter)  // "goodbye"
```

```javascript
let greeter = "hello"

if (true) {
    let greeter = "goodbye"
}

console.log(greeter)  // "hello"
```

Both `var` and `let` are hoisted to the top. If you try to call a `var` variable before it is defined, it will be initialised with a value of `undefined`. `let` will not do this, instead raising a `ReferenceError`.

```javascript
console.log(aaa)
var aaa  // undefined
```

```javascript
console.log(aaa)
let aaa  // ReferenceError: aaa is not defined
```

### `const`

`const` is the standout declaration, in that once declared it cannot have its value changed. Both `var` and `let` can have their values re-assigned.

Like `let`, however, `const` cannot be re-declared and is not initialised with a value of undefined.

`const` requires a value when declared, and will raise a `SyntaxError` is declared without a value.

```javascript
let aaa  // no error
const bbb  // SyntaxError: Missing initializer in const declaration
var ccc  // undefined
```

Objects declared with `const` are a bit different. The objects themselves cannot be updated, their properties can be.

```javascript
const car = {
  wheels: 4,
  colour: "black"
}

// this will fail
car = {
  wheels: 4,
  colour: "red"
}

// but this is okay
car.colour = "red"
```

Sources
-------

- https://www.freecodecamp.org/news/var-let-and-const-whats-the-difference/
- https://ui.dev/var-let-const/
