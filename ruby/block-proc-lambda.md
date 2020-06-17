Blocks, Procs, Lambdas
======================

Blocks
------

"Blocks" is what Ruby calls closures. They are chunks of code enclosed between `{ ... }` braces or `do...end`. (As a standard, braces are used for single-line blocks and `do...end` for multiline.) They are not objects.

### Calling blocks in methods

If you want to use a block inside a method, this can be accomplished implicitly using `yield` or explicitly using `.call`. The two below examples will do the same thing:

```ruby
def explicit_block
  yield
end
explicit_block { puts "Implicit block called" }
```

```ruby
def implicit_block(&block)
  block.call # same as yield
end
implicit_block { puts "Explicit block called" }
```

This is a more complex example, where the method takes both an argument and a block:

```ruby
def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  return "Block complete! Back in the method."
end

puts yield_name("Eric") { |n| puts "My name is #{n}." }

# In the method! Let's yield.
# My name is Kim.
# In between the yields!
# My name is Eric.
# Block complete! Back in the method.
```

Notice that when a block is injected into a method as above, every statement in the method was executed right up to `return`. This will not be the case with procs and lambdas. [See below](#return-statements) for more details.

Procs
-----

Procs are an instance of the `Proc` class. behave like blocks, but they can be bound to variables. In the below example, the variable `multiples_of_3` holds the value of `{ |n| n % 3 == 0 }`.

```ruby
multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end

print (1..100).to_a.select(&multiples_of_3)
```

A proc being a class instance, its value cannot be accessed directly through something like `puts multiples_of_3`. This would just return the memory location for the instance. To call a proc, use the `.call` method, like as follows:

```ruby
hi = Proc.new { puts "Hello!" }
hi.call
```

Here is another example, where a method is both taking a regular argument and also yielding to a proc which has been converted into a block.

```ruby
def greeter(a)
  puts a
  yield
  return "We're done here"
end

phrase = Proc.new { puts "Hello there!" }

greeter('About to say hi...', &phrase)

# About to say hi...
# Hello there!
```

In the example above, notice that the return statement was skipped over. This is because when a method yields a proc, that proc is returned immediately without going back to the method. [See below](#return-statements) for more details.

Lambdas
-------

Lambdas are like procs but with different syntax. Functionally, they accomplish the same thing but with a few exceptions:

1. A lambda is not a class. There is no such thing as `Lambda.new` because there is no class to initialise. Strictly speaking, it is a special kind of `Proc` object.

2. A lambda will check the number of arguments being passed to it. If it receives the wrong number of arguments, it will throw an error. By contrast, a proc will merely return a `nil` in the same situation.

3. When a lambda is called in a method, control reverts back to the method. That is, calling a lambda inside a method will not return with the lambda evaluation and the method will continue to execute. [See below](#return-statements) for more details.

The syntax for creating a lambda is either `some_lambda = -> { puts "This is a lambda" }` or `some_lambda = lambda { puts "This is a lambda" }`. Like procs, lambdas will not run when defined; they have to be called.

A lambda can also take an argument, like as follows:

```ruby
times_two = ->(x) { x * 2 }
times_two.call(10)
# 20
```

Here is an example of a lambda being passed to a `.map` method, transforming an array which that method is called on:

```ruby
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |z| z.to_sym }
symbols = strings.map(&symbolize)
# [:leonardo, :donatello, :raphael, :michaelangelo]
```

Return statements
-----------------

A proc and a lambda will react differently to a `return` statement (as mentioned above). To summarise,

- A proc will return from the current context; that is, when called before a `return` statement it will return the proc evaluation and the method will stop executing.

- A lambda called in a similar manner will not return its evaluated value and the method will continue executing as if nothing happened.

Consider the following three examples:

```ruby
def batman_ironman_block
  yield
  return "Iron Man will win!"
end

puts batman_ironman_block { puts "Batman will win!" }

# Batman will win!
# Iron Man will win!

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  return "Iron Man will win!"
end

puts batman_ironman_proc

# Batman will win!

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  return "Iron Man will win!"
end

puts batman_ironman_lambda

# Iron Man will win!
```

Sources
-------

- https://blog.appsignal.com/2018/09/04/ruby-magic-closures-in-ruby-blocks-procs-and-lambdas.htm
- https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/
