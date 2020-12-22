Polymorphism
============

> Polymorphism in Object-Oriented Programming is an ability to create a property, a function, or an object that has more than one realization.<br><br>
Polymorphism is an ability to substitute classes that have common functionality in sense of methods and data. In other words, it is an ability of multiple object types to implement the same functionality that can work in a different way but supports a common interface.

### `super()`

It is not necessary to use a constructor in a subclass. The subclass will use the parent's constructor if one is not defined in the subclass. If you use a constructor in a subclass, the first line needs to be `super()`.

`super()` is an alias for the constructor of the parent class. In initialising the subclass, the parent class constructor still applies and will be applied first when the subclass is invoked. The subclass will then overwrite or add new properties and otherwise make modifications. `super()` can take arguments, which are passed to the parent class.

```javascript
class Dog {
  constructor(legs, tail) {
    this.legs = legs
    this.tail = tail
  }
}

class Dog extends Animal {
  constructor(kennel) {
    super(4, true)
    this.breed = kennel
  }
}
```

Sources
-------

- https://medium.com/@viktor.kukurba/object-oriented-programming-in-javascript-3-polymorphism-fb564c9f1ce8
