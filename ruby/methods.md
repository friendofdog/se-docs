Methods in Ruby
===============

Implicit return
---------------

Methods have implicit returns, meaning that if a `return` statement is not supplied the method will return the last evaluated expression. For example, the following will return `5` despite `return` being absent from the method:

```ruby
def add_some_ints
  1 + 4
end  
```
