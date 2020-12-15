Arrow Functions
===============

Scoping
-------

One of the intentions behind arrow functions is make usage of the `this` keyword more straightforward. Arrow functions are lexically scoped – the `this` keyword refers to the current surrounding scope.

In the example below, `this` refers to two very differnt objects: the global object in `normalFunc()` and a lexical scope in `arrowFunc()`.

```javascript
function normalFunc() {
  console.log("Current scope:", this)
}

const arrowFunc = () => {
  console.log("Current scope:", this)
}

normalFunc()  // → Current scope: [object global]
arrowFunc()  // → Current scope: [object Object]
```

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

- https://www.codementor.io/@dariogarciamoya/understanding-this-in-javascript-with-arrow-functions-gcpjwfyuc
- https://www.freecodecamp.org/news/learn-es6-the-dope-way-part-ii-arrow-functions-and-the-this-keyword-381ac7a32881/
