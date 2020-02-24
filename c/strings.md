Strings
=======

> Strings are actually one-dimensional array of characters terminated by a null character '\0'. Thus a null-terminated string contains the characters that comprise the string followed by a null.

Strings in C
------------

Every character in a string has a location in memory (represented like `0x100001`). A string terminates when it reaches a null (or "zero byte") character (`\0`), at which point C knows that the string is complete. (It is not necessary to add in this character. The C compiler will do this automatically.)

<img src="https://github.com/friendofdog/se-docs/raw/master/img/string_representation.jpg" width=500>

Sources
-------

- https://www.tutorialspoint.com/cprogramming/c_strings.htm
- https://chortle.ccsu.edu/AssemblyTutorial/Chapter-20/ass20_2.html
