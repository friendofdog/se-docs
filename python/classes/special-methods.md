Special (Magic/Dunder) Methods
==============================

By default, if you try to print an object it will just show the memory location of that object.

```
class Book():

    def __init__(self,title,author,pages):
        self.title = title
        self.author = author
        self.pages = pages

book = Book("Some Book", "Some Guy", 200)

print(book) # returns memory location
```

There are built-in methods which return user-specified data when certain functions call an object. Among these are `__str__` and `__len__`.

```
class Book():

    ...

    def __str__(self):
        return f'{self.title} by {self.author}'

    def __len__(self):
        return self.pages

book = Book("Some Book", "Some Guy", 200)

print(str(book)) # returns string from __str__
                 # would also work with print(book) as str() is implied
print(len(book)) # returns length from __len__
```

Another such method is `__del__`, which is called when the instance of an object is deleted using `del`. Note that `__del__` uses print() while `__str__` and `__len__` use return (by convention; you could just return something).

```
class Book():

    ...

    def __del__(self):
        print(f'{self.title} has been deleted')

book = Book("Some Book", "Some Guy", 200)

del book # runs __del__ method
```
