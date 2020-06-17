Symbols
=======

Symbols are immuable identifiers commonly used in hashes or to refer to method names. They are constructed with the syntax `:some_symbol`, or with the `.to_sym` and `.intern` methods. Being immutable, once created they cannot be changed.

When used for hash keys, symbols can take on a different syntax (resembling Python dictionaries). The `:` is moved to the end of the key and the `=>` is dropped, like such:

```ruby
numbers = {
  one: 1,
  two: "two",
  three: 3,
}
```

Symbols should be used over strings wherever possible. Iterating over the above hash using string keys would take twice as long.

The `Symbol` class
------------------

Strictly speaking, a symbol is an instance of the `Symbol` class. It cannot be publically instanted, but is implicitly done so when a new symbol is created.

Sources
-------

- https://medium.com/rubycademy/symbol-in-ruby-daca5abd4ab2
- Codecademy Ruby track
