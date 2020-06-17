Ruby Basics
===========

### variables

```ruby
some = 'string'
puts some
```

### math

```ruby
puts 17 % 6
puts 2 ** 4
```

### string methods

```ruby
puts "this is a string".length
puts "reverse this string".reverse
puts "PuT this iN aLl CapS".upcase
puts "THIS IN LOWER".downcase
```

### naming conventions

```ruby
good_var_name = ''
badVarName = ''
$veryBadName = ''
```

### comments

```ruby
# this is a single line comment
```

```ruby
=begin
this is a multiline
comment
desu
=end
```

### get user input and string manipulation

```ruby
print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!
print "What's your last name? "
last_name = gets.chomp
last_name.capitalize!
print "What city are you from? "
city = gets.chomp
city.capitalize!
print "What state/prov are you from? "
state = gets.chomp
state.upcase!
puts "Your name is #{first_name} #{last_name}. You are from #{city}, #{state}"
```

### conditional statements

```ruby
print "Enter integer "
int = Integer(gets.chomp)
if int > 0
  puts "more than 0"
elsif int < 0
  puts "less than 0"
else
  puts "is 0"
end
```

```ruby
unless 1 > 2
  puts "1 not > 2"
else
  puts "1 > 2"
end
```

### boolean operators

```ruby
boolean_1 = !true
boolean_2 = !true && !true
boolean_3 = !(700 / 10 == 70)

puts boolean_1
puts boolean_2
puts boolean_3
```

### loops

```ruby
i = 0
while i < 5
  puts i
  i += 1
end
```

```ruby
counter = 1
until counter > 10
  puts counter
  counter += 1
end
```

### looping in ranges

```ruby
for num in 1..15
  puts num
end
```

```ruby
for num in 1...15
  puts num
end
```

### looping with iterators

```ruby
i = 20
loop {
  i -= 1
  print "#{i}"
  break if i <= 0
}
```

```ruby
i = 20
loop {
  i -= 1
  next if i % 2 == 1
  print "#{i}"
  break if i <= 0
}
```

### iterating with `.each`

```ruby
array = [1,2,3,4,5]

# same as array.each { ... }
array.each do |x|
  x += 10
  print "#{x}"
end
```

### iterating with `.times`

```ruby
4.times do
  puts "doing something"
end
```

### sorting hashes

```ruby
colors = {
  "blue" => 3,
  "green" => 1,
  "red" => 2
}
colors = colors.sort_by do |color, count|
  count
end
colors.reverse!
```

### sorting with comparison operator

```ruby
fruits = ["orange", "apple", "banana", "pear", "grapes"]

fruits.sort! do |a,b|
  b <=> a
end
```

### hash default values
```ruby
no_nil_hash = Hash.new("adsf")
no_nil_hash = {
  'some' => 'guy',
  'cat' => 'dog'
}
print no_nil_hash['qwer']
# "asdf"
```

### iterate hash, just key or value

```ruby
my_hash = { one: 1, two: 2, three: 3 }

my_hash.each_key { |k| print k, " " }
# ==> one two three

my_hash.each_value { |v| print v, " " }
# ==> 1 2 3
```

### illustration of CRUD in Ruby

```ruby
movies = Hash.new

movies = {
  cat: 3,
  dog: 5,
  pig: 2
}

puts "What do you want to do?"
choice = gets.chomp

case choice
  when "add"
    puts "Enter movie to add"
    title = gets.chomp.to_sym
    if movies[title.to_sym]
      puts "#{title} already exists"
    else
      puts "Enter rating"
      rating = gets.chomp.to_i
      movies[title] = rating
    end
  when "update"
    puts "Enter movie to update"
    title = gets.chomp.to_sym
    if movies[title.to_sym]
      puts "Enter rating"
      rating = gets.chomp.to_i
      movies[title.to_sym] = rating
    else
      puts "#{title} does not exist yet"
    end
  when "display"
    movies.each do |movie, rating|
      puts "#{movie}: #{rating}"
    end
  when "delete"
    puts "Enter movie to delete"
    title = gets.chomp.to_sym
    if movies[title.to_sym]
      movies.delete(title.to_sym)
    else
      puts "#{title} does not exist"
    end
  else
    puts "Error!"
end

puts movies
```

### conditional assignment

```ruby
favorite_book = nil
puts favorite_book

favorite_book ||= "Cat's Cradle"
puts favorite_book

favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book

favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book
```

### upto and downto

```ruby
95.upto(100) { |num| print num, " " }
# prints 95 96 97 98 99 100
```

```ruby
'C'.downto('A') { |let| puts let }
# print C B A
```

### check method by object

```ruby
age = 26
age.respond_to?(:to_i)
```

### check object class

```ruby
a = 'some string'
a.is_a? String # true
a.is_a? Integer # false
```

### collect

```ruby
fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

doubled_fibs = fibs.collect { |num| num * 2 }
puts doubled_fibs
```
