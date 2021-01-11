`this` Keyword
==============

`this` is a keyword which refers to the context in which it is invoked. It is evaluated at runtime, meaning that it contain anything useful until the code containing it is run (this is called "runtime binding"). Consequently, `this` could be several different things each time it is used.

`this` is affected by [scope](./javascript/scope.md) but is not

It has different values depending on where it is used:

In a method, this refers to the owner object.
Alone, this refers to the global object.
In a function, this refers to the global object.
In a function, in strict mode, this is undefined.
In an event, this refers to the element that received the event.
Methods like call(), and apply() can refer this to any object.

Binding
-------

[Summarise default / implicit / explicit / new from tech-tajawal article]

Manipulating `this`
-------------------

[Think of a better header]

### `bind()` method

`bind()` operates on a function to bind the value of of the function's `this` to an object.

```javascript
class Person = {
  constructor
  name: "Guy",
  getName: function() {
    return `My name is ${this.name}`
  }
}

const sayName = guy.getName

const boundSayName = sayName.bind(guy)
```

For example, you have a function, `getName()`. `getName().bind(Person)` will set the value of `this` to `Person` whenever it is used in `getName()`. See [`bind`](./javascript/sbo.md#bind) for more details.

### Arrow functions

[Short summary]

See [arrow functions](./javascript/functions/arrow.md#this-in-arrow-functions) for more details.

Sources
-------

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this
- https://medium.com/@mayanovarini/what-is-this-in-javascript-934f468c1348
- https://medium.com/tech-tajawal/javascript-this-4-rules-7354abdb274c
