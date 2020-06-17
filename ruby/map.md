Map
===

Note: The `map` and `collect` methods are the same thing. It is more conventional to use `map`, as that word is used more commonly in other languages.

`map` is used to transform data in arrays, hashes, and ranges. It has two syntaxes:

`object.map { |x| [do something] }` # normal

`object.map(&:[do something])` # shorthand

Normal `map` syntax
-------------------

The block in `map` dictates how you want to transform the data. In the below example, this transformation is the capitalisation of strings contained in an array:

```ruby
animals = ["cat", "dog", "pig"]
animals.map { |a| a.upcase }
# ["CAT", "DOG", "PIG"]
```

You can also map with index:

```ruby
animals = ["cat", "dog", "pig"]
animals.map.with_index { |a, i| "#{i}: #{a}" }
# ["0: CAT", "1: DOG", "2: PIG"]
```

Shorthand `map(&)` syntax
-------------------------

In the below example, `objects.map(&:class)` is the same things as `objects.map(|o| o.class)`:

```ruby
objects = [1, "qwrety", [1,2,3]]
objects.map(&:class)
# [Fixnum, String, Array]
```

Sources
-------

- https://www.rubyguides.com/2018/10/ruby-map-method/
