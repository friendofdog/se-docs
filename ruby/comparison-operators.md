Evaluation in Ruby
==================

Short-circuit evaluation
------------------------

Ruby will only evaluate an expression until it knows what the evaluation will resolve to. For example, the outcome of `(3 == 1) && (1 == 1)` is known before the right side is considered; so Ruby will stop after evaluating the left side, which is `false` and return `false`.

Here is a more complex example. `def b` will not execute because the evaluation can be completed only knowing the left side.

```ruby
def a
  puts "A was evaluated!"
  return true
end

def b
  puts "B was also evaluated!"
  return true
end

puts a || b
```

Ternary operator
----------------

A ternary operator is functionally like an if-else statement: it performs a binary evaluation on something and returns one of two possible outputs. The syntax is:

`[method] [thing to evaluate] ? [object if true] : [object if false]`

For example:

```ruby
go_now = true

puts go_now ? "Going now" : "Not moving"
```
