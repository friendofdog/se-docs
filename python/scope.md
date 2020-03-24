Scope
=====

LEGB rule
---------

When a variable is called, Python will look for it in the below order.

- L: local
  Names assign in any way within a function and not declared global within that function
- E: enclosing
  Names in the local scope of any and all enclosing functions, from inner to outer
- G: global (module)
  Names assigned at the top level of a module file or declared global in a function within the file
- B: build-in (Python)
  Names pre-assigned in the build-in name module (`open`, `range`, `SyntaxError`, etc.)

```
# squishybears.py

name = "Pierre"

-------------------

# global
from squishybears import name

# global
name = "Wuzwuz"

def greet():
    # enclosing
    name = "Puffy"

    def hello():
        # local
        name = "Kozy"
        print('Hello', name)

    hello()
```

Global variables
----------------

Global variables are declared at the top (non-indented) level in a script (or imported in a module). To change a global variable's value inside a function, need to call `global` followed by variable name within the function. The function will then operate on the global variable instead of a local one.

```
# global
name = "Wuzwuz"

def greet():
    global name
    name = "Puffy"
    # now operating on global "name" variable, not a local one
```
