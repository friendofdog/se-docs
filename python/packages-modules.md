Packages and Modules
====================

Modules
-------

Modules are Python scripts which are called and used by other Python scripts. Example module import:

```
# ./mymodule.py

def say_hello():
    print("Hello")
```

```
#./myscript.py
from mymodule import hello

hello()
```

Packages
--------

Packages serve the same purpose as modules, but are structured in a folder hierarchy to allow for better organisation.

### Structure

Below is an example of how modules could be organised into a package.

```
/
    mainscript.py

    /mymodules
        __init__.py
        somemodule.py

        /mysubmodules
            somesubmodule.py
```    

### The `__init__.py` file

Each folder in a package must contain a `__init__.py` file, which lets Python know that its contents are modules. This file can be blank, or it can contain an index of modules.

Indexes are constructed using the `__all__` variable. Say a package contained only the modules `foo.py` and `bar.py`. The index would look like the following.

```
__all__ = ["foo","bar"]
```

Example: creating a package of classes
--------------------------------------

One way to import everything in a folder is to assemble everything in the `__init__.py` file and import it in one go. For example, below is an instance of classes being stored in a single folder and imported into a script (without importing anything – like functions – which might exist outside the classes).

```
/
    main.py

    /classes
        Zones.py
        Server.py
        Query.py
        QueryHeader.py
        QueryBody.py
        ResponseHeader.py
        __init__.py
```

```
# ./main.py

# grabs everything present in ./classes/__init__.py
from classes import *
```

```
# ./classes/__init__.py

# grabs classes from every file in ./classes/
from .Zones import Zones
from .Server import Server
from .Query import Query
from .QueryHeader import QueryHeader
from .QueryBody import QueryBody
from .ResponseHeader import ResponseHeader
```

Sources
-------

- https://docs.python.org/3/tutorial/modules.html#packages
- https://python4astronomers.github.io/installation/packages.html
