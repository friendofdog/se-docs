`os` Module
===========

Useful functions
----------------

`os.open()`, `os.fdopen()`, `os.close()`

`os.open()` opens a file path, returning a file descriptor. Takes a number of flags, which are [taken from C](http://man7.org/linux/man-pages/man2/open.2.html).

`os.fdopen()` creates a file object using a descriptor. The function call `open()` is like using `os.open()` and then immediately calling `os.fdopen()`.

`os.close()` closes the file.

Managing working directory
--------------------------

The current working directory can be checked with `os.getcwd()`. It can be changed with `os.chdir()`.

A useful application of this is to set the working directory relative to the current file. For example, path of the file can be attained using `path = os.path.dirname(os.path.realpath(__file__))`. Then the working directory can be set using `os.chdir(path)`.

Sources
-------

- https://docs.python.org/3/library/os.html
- https://python.readthedocs.io/en/stable/library/os.html
- https://www.geeksforgeeks.org/python-os-open-method/
- https://www.tutorialspoint.com/python3/os_open.htm
- https://note.nkmk.me/en/python-os-getcwd-chdir/
