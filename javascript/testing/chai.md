Chai
====

Testing errors
--------------

A function can be tested for throwing an error in (at least) two ways: for merely having the capacity to throw an error or for throwing an error under specific circumstances.

For example, take the following code-under-test:

```javascript
// function under test
const someFunc = (n) => {
  if (n === 123) throw new Error("err happened");
  return;
}
```

The below test would confirm that an error can be thrown at some point in the function, but does not take arguments or any other conditions into consideration. 

```javascript
const { someFunc } = require("path/to/module");

describe("someFunc", () => {
  it("should throw error, conditions unknown", () => {
    expect(someFunc).to.throw("err happened");
  });
});
```

The test an error against specific instances of a function call resulting in an error, it is necessary to use `protocol.bind` on the module under test. (In many cases, this prevents the use of a deconstructive import.)

```javascript
const module = require("path/to/module");

describe("someFunc", () => {
  it("should throw error if n equals 123", () => {
    expect(module.someFunc.bind(module, 123)).to.throw("err happened");
  });
});
```
