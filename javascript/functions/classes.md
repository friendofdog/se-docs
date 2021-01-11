Classes
=======

Classes are a special type of function which are used for creating objects. They comprise of data used to create said objects and methods to operate on that data.

Everything inside the body of a class is run in strict mode.

Defining classes
----------------

Classes can be defined using either of the following:

- class declaration: `class SomeClass {}`
- class expression: `const SomeClass = class {}`

Classes can be named or anonymous, as is the case of the above class expression. Once declared, classes cannot be re-declared – if attempted, will throw `Uncaught SyntaxError`. Classes do not hoist (must declare class before you can access it).

Below is an example of defining a class using a class declaration.

```javascript
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
    this.description = "a long square"
  }
  area() {
    return this.height * this.width;
  }
};

const rect = new Rectangle(5, 8);
console.log(rect.area());  // → 40
```

Class methods
-------------

### `constructor()` method

`constructor([arguments]) { ... }`

This is a special method for initialising a class. It can take arguments, which are passed to the constructor when invoking `new SomeClass(arg1, arg2)`.

The constructor is not mandatory. If not explicitly provided, an empty one is automatically applied at class instantiation.

If the class is a child class, it can inherit the parent's class using the `super()` method.

```javascript
constructor(...args) {
  super(...args);
}
```

```javascript
console.log(Rectangle.name);  // → Rectangle
console.log(Rectangle.description);  // → undefined
console.log(Rectangle.area());  // → TypeError

const rect = new Rectangle(5, 8);

console.log(rect.name);  // → undefined
console.log(rect.description);  // → a long square
console.log(rect.area());  // → 40
```
