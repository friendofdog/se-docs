Error and Exception Handling
============================

If an error is encountered in Python, the script stops and nothing further can happen. If there is a piece of code where errors might be expected, the below is a way to handle them.

```
try:
    # this will fail because some_int is a string, and you can't add str and int
    some_int = input("Enter a number")
    result = 10 + some_int

except:
    # this will run if an error is encountered
    print("Something went wrong")

else:
    print("Everything is okay")
    print(result)
```

You can specify errors by type for `except` to catch. For example, the above code would result in a `TypeError`. The below is how `except` would only catch `TypeError`.

```
except TypeError:
    print("TypeError encountered")
```

A full list of built-in error types can be found on [Python documentation](https://docs.python.org/3/library/exceptions.html).

To run a block of code regardless of whether an error is encountered or not, use `finally`. This does not work independently of `except`, and in fact requires `except` to function.

```
result = 10

try:
    result += "some string"

except:
    print("some error happened")

finally:
    print(result)
```

This sort of error handling works well for a `while` loop.

```
def ask_for_int():
    while True:
        try:
            val = int(input("Please enter an integer: "))
        except:
            print("Looks like you did not enter an integer!")
            continue
        else:
            print("Yep that's an integer!")
            print(val)
            break
        finally:
            print("This will always run, even if you enter an integer")
```

Sources
-------

- https://docs.python.org/3/library/exceptions.html
- https://docs.python.org/3.3/tutorial/errors.html
