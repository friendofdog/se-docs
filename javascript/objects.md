Objects
=======

Dot notation, bracket notation
------------------------------

Dot notation:
- Property identifies can only be alphanumeric (and `_` and `$`)
- Property identifiers cannot start with a number.
- Property identifiers cannot contain variables.
- OK — `obj.prop_1`, `obj.prop$`
- Not OK — `obj.1prop`, `obj.prop name`

Bracket notation:
- Property identifiers have to be a String or a variable that references a String.
- It is okay to use variables, spaces, and Strings that start with numbers
- OK — `obj["1prop"]`, `obj["prop name"]`

Sources
-------

- https://codeburst.io/javascript-quickie-dot-notation-vs-bracket-notation-333641c0f781
