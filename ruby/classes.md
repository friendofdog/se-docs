Classes
=======

Instance vs. class methods
--------------------------

Instance methods are called on an instance of a class and cannot be called on the class itself. They are created with the syntax: `def method_name()`. Class methods are created directly on the class. The class name preceeds the method name, as in `def ClassName.method_name()`. They cannot be called on an instance of the class.

Each method type uses its counterpart variable type. Class methods use class variables (`@@variable`); instance methods use instance variables (`@variable`).

Below is an example of both kinds of methods at work.

```ruby
class Machine
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end

  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"
```

Public and private methods
--------------------------

Methods can be public or private. Public methods can be accessed from outside the class; private ones can only be called by other code inside the object. By default, methods are public.

Syntax illustrated in below example:

```ruby
class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  public

  def bark
    puts "Woof!"
  end

  private

  def id
    @id_number = 12345
  end
end
```

Class inheritance
-----------------

Unlike some other languages, Ruby classes can only have a single superclass. That is, a class cannot inherit two or more classes. (To get around this, use [mixins](./modules.md#mixins).)

```ruby
class Mammal
  def initialize(name, lifespan, mammary_glans)
    @name = name
    @lifespan = lifespan
    @mammary_glans = mammary_glans
  end
  def introduce_self
    puts "I am a #{@name}. I live for #{@lifespan} years and have #{@mammary_glans} mammary glans."
  end
end

class Marsupial < Mammal
  def initialize(name, lifespan, mammary_glans, pouch)
    super(name, lifespan, mammary_glans)
    @pouch = pouch
  end
  def introduce_self
    super
    puts "I have a pouch." if @pouch
  end
end

koala = Marsupial.new('koala', 15, 2, true)
koala.introduce_self
```

Object data and scope
---------------------

By default, data within an object is private. Trying to access a property directly will result in an error. For example, the following will not work:

```ruby
class Animal
  def initialize(name, genus)
    @name = name
    @genus = genus
  end
end

dog = Animal.new('dog', 'canine')
puts dog.genus # => undefined method 'dog'
```

### Getter and setter methods

Because object methods are public by default, wrapping a property in a getter method will make it accessible outside the class. The following will make the `genus` property externally readable:

```ruby
class Animal
  def initialize(name, genus)
    @name = name
    @genus = genus
  end

  def genus
    @genus
  end
end

dog = Animal.new('dog', 'canine')
puts dog.genus # => 'canine'
```

To make a property writeable, a setter method can be used:

```ruby
class Animal
  def initialize(name, genus)
    @name = name
    @genus = genus
  end

  def genus
    @genus
  end

  def genus=(genus)
    @genus = genus
  end
end

dog = Animal.new('dog', 'canine')
dog.genus = 'feline'
puts dog.genus # => 'feline'
```

### `attr_*` methods

- `attr_reader` does what a getter method does
- `attr_writer` does what a setter method does
- `attr_accessor` does both together

```ruby
class Animal
  attr_reader :genus
  def initialize(name, genus)
    @name = name
    @genus = genus
  end
end

dog = Animal.new('dog', 'canine')
puts dog.genus # => 'canine'
```

```ruby
class Animal
  attr_reader :genus
  attr_writer :genus
  def initialize(name, genus)
    @name = name
    @genus = genus
  end
end

dog = Animal.new('dog', 'canine')
dog.genus = 'feline'
puts dog.genus # => 'feline'
```

```ruby
class Animal
  attr_accessor :genus
  def initialize(name, genus)
    @name = name
    @genus = genus
  end
end

dog = Animal.new('dog', 'canine')
dog.genus = 'feline'
puts dog.genus # => 'feline'
```

Sources
-------

- http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/
- https://mixandgo.com/learn/ruby_attr_accessor_attr_reader_attr_writer
