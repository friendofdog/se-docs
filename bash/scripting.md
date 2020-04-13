Bash Scripting
==============

Bash scripts allow you to execute bash commands from a file, like one would from the command line. Script takes the `.sh` file extension, but still require a declaration of interpreter in the script itself (see below).

The shell is the interpreter. Because the shell is built into Unix, this allows you to use the entire Unix toolset without the need for dependencies (as with Python, for example). This makes bash scripting suitable for tasks such as...
	- file management
	- system management
	- automating tasks

To run your script, don't forget to make it executable: `chmod +x somescript.sh`.

Shebang
-------

Unix does not know which interpreter to use by file extension alone. Shebang (`#!`) is the declaration of the interpreter. This goes at the top of the script, before everything else.

`#!/bin/bash` evokes the bash interpreter on a script. Could also use Python `#!/bin/python` or even shell `#!/bin/sh`. Other less-used interpreters include `#!/bin/csh` and `#!/bin/ksh`

Variables
---------

Variable names must be:
- upper case
- letters, numbers, and underscore
- not starting with a number

When declaring a variable or changing its value, just use the variable name. To evoke a variable, use dollar sign (`$`) before the variable name.
- `NAME="JOHN"` will set "John" for value of name
- `echo "My name is $NAME"` will evoke the variable NAME and echo "My name is John"

Cannot have spaces between initialisation of variable name and its value. If there is a space, this is taken to be a comparative statement.
- `NAME="John"` declares value of NAME
- `$NAME = "John"` checks the value of NAME against "John"

To concatenate a variable with character (other than a space), use curly braces.
- `echo "My name is ${NAME}ny"` => "My name is Johnny"

User input
----------

Value can be assigned to a variable in the middle of the script, taking user input. This is accomplished using `read`. For example, `read -p "type something here: " THING`:
- `read` means that the script is taking input from user
- `-p` will output some text to prompt user
- `THING` is the variable in which user-entered value is stored

Multiple inputs can be taken at the same time. They are separated by a space. For example, `read NAME AGE`. If the user enters `John 33`, NAME will be "John" and AGE will be "33".

Conditional statements
----------------------

Conditional statements do not follow conventional syntax.

```
read -p "Type your NAME followed by password: " NAME PASSWORD

if [ "$PASSWORD" = "qwerasdf" ];
then
        echo "Welcome, ${NAME}."
else
        echo "Wrong password."
fi
```

There are a good number of conditionals you can test for. See `help test` for a list.

Functions
---------

Unlike some other languages, you cannot call a function on a line above where the function is defined.

Functions do follow conventional syntax.

```
function doSomething(){
  echo "This is a function"
}
```

```
function returnAnInteger(){
  return 5+5
}
```

`return` can only be used with numbers. Strings should use `echo`. (Not entirely sure this is true, but it works so far.)

Positional parameters
---------------------

Positional parameters are parameters entered in the command line when evoking a bash script. Parameters occupy a rang from 0-9, depending on order entered in command line. Position 0 is always the script itself.

In the bash script, a parameter can be called by position with dollar sign.
- e.g. `some-script.sh some_parameter`
- `some_parameter` corresponds with `$1` in the bash script

Sources
-------

- https://www.youtube.com/playlist?list=PLBf0hzazHTGMJzHon4YXGscxUvsFpxrZT
- https://www.youtube.com/watch?v=yIuPu4iLcY4
