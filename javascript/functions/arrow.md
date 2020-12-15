Arrow Functions
===============

`this` in arrow functions
-------------------------

For more information on `this` see [this](./javascript/this.md).

One of the intentions behind arrow functions is make usage of the `this` keyword more straightforward. Arrow functions do not come with their own `this`; they instead inherit the current surrounding scope. This is called "[lexical scoping](./javascript/scope.md#environments-execution-lexical-variable)".

In the example below, `this` refers to some very different objects: the global object in `normalFunc()` and the closest scopes surrounding `this` in `arrowFunc()`.

```javascript
function normalFunc() {
  console.log("Current scope:", this)
}

const arrowFunc = () => {
  console.log("Current scope:", this)
}

normalFunc()  // → Current scope: Object [global] { ... }
arrowFunc()  // → Current scope: {}
```

Here is another more complex example. It illustrates that in a `function` function, `this` does not pick up on the `separator` property of the surrounding `someObject` object. Thus, `this.separator` is `undefined` as the global object has no `separator` property.

```javascript
const someObject = {
  separator: "-",
  purchases: ["apple", "dog", "car"],
  getPurchases() {
    console.log(this.purchases.reduce(function(a, b) {
      return a + this.separator + b
    }))
  }
}

someObject.getPurchases()  // → appleundefineddogundefinedcar

const someObject = {
  separator: "-",
  purchases: ["apple", "dog", "car"],
  getPurchases() {
    console.log(this.purchases.reduce((a, b) => {
      return a + this.separator + b
    }))
  }
}

someObject.getPurchases()  // → apple-dog-car
```

Sources:

- https://www.codementor.io/@dariogarciamoya/understanding-this-in-javascript-with-arrow-functions-gcpjwfyuc
- https://www.freecodecamp.org/news/learn-es6-the-dope-way-part-ii-arrow-functions-and-the-this-keyword-381ac7a32881/
- https://medium.com/@mayanovarini/what-is-this-in-javascript-934f468c1348
