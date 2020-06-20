Modules
=======

Modules hold methods and other information, like classes, but they are more static in nature. They cannot be instantiated and it is not possible to create a new object from one.

The syntax of a module is as follows:

```ruby
module Greeting
  def hello
    puts 'Hello and welcome'
  end
end
```

The purpose of modules is to provide a namespace and to implement a mixin facility.

Namespacing
-----------

Namespacing is a way of collecting logically related objects. It provides logical cohesion and prevents collisions between objects which have the same name.

Below is an example of namespacing at work:

```ruby
module Greeting
  class Application
    def hello
      puts 'Hello and welcome'
    end
  end
end
```

The name "Application" is quite common and, taken on its own, ambiguous. By including it in the samespace `Greeting`, this helps prevent collision with other `Application` classes that might exist and tells us something about the class itself.

`Application` can be accessed using the scope resolution operator, `::`. In this case, it would be `Greeting::Application`. This is how you would instantiate the `Application` class:

```ruby
greet_someone = Greeting::Application.new
greet_someone.hello # -> 'Hello and welcome'
```

Mixins
------

When a module is used to introduce behaviour or information to a class or another module, it's a mixin. Mixins satisfy "composition over inheritance": the idea that a class should be composed of objects responsible for functionality, rather than passing said functionality to the class through a chain of inheritance.

There are three ways to include a mixin into a class or another module: `include`, `prepend`, and `extend`.

### `include`

Includes a module in a lower position in the ancestor chain than the host class / module. This means that properties of the module can be overwritten.

```ruby
module Greeting
  def hello
    puts 'Hello and welcome'
  end
end

class WarmGreeting
  include Greeting
  def hello
    puts 'A warn welcome to you'
  end
end

WarmGreeting.new.hello # -> 'A warm welcome to you'
```

This is the most common way of using a mixin (based on occurances in tutorials and on Stack Overflow).

### `prepend`

`prepend` includes a module at a higher position in the ancestor chain than the host class / module. This means that properties cannot be overwritten. For example, if you re-declare a method using the same name as one in the included module, nothing will happen.

```ruby
class ColdGreeting
  prepend Greeting
  def hello
    puts 'What do you want?'
  end
end

ColdGreeting.new.hello # -> 'What do you want?'
```

### `extend`

`extend` is like `include` in that modules are included at a lower ancestor chain position; but it is included on the singleton class of a class / module (not the class / module itself).

```ruby
class NeutralGreeting
  extend Greeting
  def hello
    puts 'Hi'
  end
end

NeutralGreeting.new.hello # -> 'Hi'
```

Loading external modules
------------------------

If a module is to be used in another file, it needs to be loaded using a `require` statement. `require` is not exclusive to modules; it is used to load the contents of one file into another. By convention, this is usually done with modules.

The syntax is `require filename` (without the `.rb` extension). This is typically done at the top of the file, like as follows:

```ruby
require somefile
```

Note that you can also use `load somefile.rb`. However, whereas `require` only loads the file once, `load` will load the file every time some code in it is executed.

Sources
-------

- https://medium.com/rubycademy/modules-in-ruby-part-i-a2cdfaccdb6e
- https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html
