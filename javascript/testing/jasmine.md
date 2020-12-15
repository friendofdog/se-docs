Jasmine
=======

Methods of Jasmine:

- `describe(str, func)`
  - string: is the description for the test suite
  - function: is a block of code that implements the suite
- `beforeAll(func)` (optional)
  - function: a hook to call once *before* any test blocks are executed
- `beforeEach(func)` (optional)
  - function: a hook to call *before* each test block is executed
- `it(str, func)`
  - string: is the description for the test suite
  - function: is a block of code that implements the suite
- `afterAll(func)` (optional)
  - function: a hook to call once *after* all test blocks are executed
- `afterEach(func)` (optional)
  - function: a hook to call *after* each test block is executed
- `expect(func).method()`
  - implements a boolean comparison between the actual value and the expected value

Tests are structured in a sort of hierarchical structure which describes the behaviour of the implementation (in line with the philosophy of [behaviour-driven development](https://en.wikipedia.org/wiki/Behavior-driven_development)).

```javascript
describe('some description', () => {
  beforeAll(() => {})
  beforeEach(() => {})
  it('some assumption', () => {
    expect(func())...  // test block
    expect(func())...  // test block
    expect(func())...  // test block
  })
  afterAll(() => {})
  afterEach(() => {})
})
```

Setting up tests
----------------

```javascript
class Customer {
  this.name = ""
}

describe("customer", () => {
  "use strict"

  beforeEach(() => {
    this.customer = new Customer()
  })

  it("should be an instance of Customer", () => {
    expect(customer).toBeDefined()
    expect(typeof customer).toBe("Customer")
  })

  it("should have a name property", () => {
    expect(customer.name).toBeTruthy()
  })
})
```

Testing arithmatic
------------------

Given the following class and its instantiation...

```javascript
class Calculator {
  add(a, b) {
    return a + b
  }
}

var some_calc = new Calculator()
```

Here are some examples of Jasmine tests for the `add()` method of `Calculator`. The method names are pretty self-explanatory. Note that `toBe()` and `toEqual()` do the same thing in this situation; [see below](#testing-comparisons) for differences between these two.

```javascript
describe('calculator', () => {
  it('should be able to add two numbers', () => {
    expect(some_calc.add(1,2)).toBe(3)
    expect(some_calc.add(1,2)).toEqual(3)
    expect(some_calc.add(1,2)).toBeLessThan(5)
    expect(some_calc.add(1,2)).toBeGreaterThan(1)
  })
})
```

`not` can be used to test implementation against values which it should *not* return.

```javascript
expect(some_calc.add(1,2)).not.toEqual(2)
expect(some_calc.add(1,2)).not.toBeLessThan(1)
expect(some_calc.add(1,2)).not.toBeGreaterThan(5)
```

Testing strings
---------------

`toMatch()` and `toContain()`

Testing instantiation
---------------------

It is also important to check for the validity of class instances. The following methods are useful in doing this:

- `toBeDefined()`
- `toBeUndefined()`
- `toBeNull()`

Taking the above `Calculator` class, the following would definitively let us know if the class was instantiated.

```javascript
it('should be able to declare the Calculator class', () => {
  expect(some_calc).toBeDefined()
  expect(some_calc).not.toBeUndefined()
  expect(some_calc).not.toBeNull()
})
```

This can be brought a step further with `toBeInstanceOf()`, which tests that the operand is an instance of a given class. This can be a user-defined class or a primitive.

```javascript
expect({}).toBeInstanceOf(Object)
expect(2).toBeInstanceOf(Number)
expect(some_calc).toBeInstanceOf(Calculator)
```

Testing comparisons
-------------------

`toBe()` and `toEqual()`

Mocking
-------

Jasmine associates the word "spy" with mocking. Here are several functions used to spy on objects and properties of objects:

```javascript
spyOn(obj, methodName)  // → {Spy}
spyOnAllFunctions(obj)  // → {Object}
spyOnProperty(obj, propertyName, [accessType])  // → {Spy}
```

Mocks can be applied pretty much anywhere, such as `beforeEach()` to mock every instance of something or in `it()` to mock only once.

If you wanted to test something which uses `Math.random()`, ideally you do not want to be testing a random number. The following example would install a spy on `Math` which ensures that `random()` returns a value of `5` every time it is called in a given `describe()` call.

```javascript
beforeEach(() => {
  spyOn(Math, 'random').and.returnValue(5)
})
```

Sources
-------

- https://jasmine.github.io/2.0/introduction
- https://jasmine.github.io/api/edge/Spy.html
- https://stackoverflow.com/questions/57325448/jasmine-when-to-use-tocontain-or-tomatch
- https://stackoverflow.com/questions/22413009/jasmine-javascript-testing-tobe-vs-toequal
- https://www.youtube.com/playlist?list=PL_noPv5wmuO9op-OQ22SbHcqFGGHA6iIZ
- https://gist.github.com/traviskaufman/11131303
