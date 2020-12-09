Data Types
==========

Data type categories
--------------------

There are three main data type categories in JavaScript: primitive (or primary), composite (or reference), and special data types.

Primitives:

- `Boolean`
- `Number`
- `String`
- `BigInt`*
- `Symbol`*

Composites (all of which are objects):

- `Object`
- `Array`
- `Function`

Special:

- `undefined`**
- `null`**

<small>
* Sometimes glossed over and not included in list of primitives<br>
** Sometimes grouped with primitives
</small>

`undefined` and `null`
----------------------

`undefined` is where a variable is declared but no value has been assigned.

```javascript
var abc;
console.log(abc)  // → undefined
console.log(typeof abc)  // → undefined
```

`null` is an object and an assigmnent value. It can be assigned to a variable explicitly.

```javascript
var abc = null;
console.log(abc)  // → null
console.log(typeof abc)  // → object
```

Adding `1` to `undefined` and `null` will have very different results. `undefined + 1` evaluates to `NaN` and `null + 1` is `1`.

Falsy and truthy values
-----------------------

The following values are "falsy" (that is, they evaluate to `false` in JavaScript):

- `""` (empty string)
- `undefined`
- `null`
- `NaN`
- `0` (numeric expression evaluating to `0`)

Unlike [in Python](../python/data-types.md#falsy-values), empty objects are always truthy. Thus, `[]`, `{}`, and `new Number(NaN)` would all evaluate to `true`.

Sources
-------

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures
- https://developer.mozilla.org/en-US/docs/Glossary/Primitive
- https://howtodoinjava.com/typescript/truthy-and-falsy
- https://www.geeksforgeeks.org/objects-in-javascript/
