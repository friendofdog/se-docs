Make
====

Recipes
-------

Every line in a recipe is a new shell process. For example, the environment variable `USER` in the below example will not be considered when evoking `some_script` because the latter is not part of the former's session.

```
foo:
    export USER=guy
    some_script --user USER
```

To get around this, [split recipe lines](https://www.gnu.org/software/make/manual/html_node/Splitting-Recipe-Lines.html) using `\`.

```
foo:
    export USER=guy && \
    some_script --user USER
```

Another way is to use [One Shell](https://www.gnu.org/software/make/manual/html_node/One-Shell.html). This, as the name suggests, runs everything in the proceeding recipe is one shell.

```
.ONESHELL:
foo:
    export USER=guy
    some_script --user USER
```

Variable assignment
-------------------

### Lazy set

`VARIABLE = value`

Normal setting of a variable, but any other variables mentioned with the value field are recursively expanded with their value at the point at which the variable is used, not the one it had when it was declared

### Immediate Set

`VARIABLE := value`

Setting of a variable with simple expansion of the values inside - values within it are expanded at declaration time.

### Lazy Set If Absent

`VARIABLE ?= value`

Setting of a variable only if it doesn't have a value. value is always evaluated when VARIABLE is accessed. It is equivalent to

```c
ifeq ($(origin FOO), undefined)
  FOO = bar
endif
See the documentation for more details.
```

### Append

`VARIABLE += value`

Appending the supplied value to the existing value (or setting to that value if the variable didn't exist)

Sources
-------

- https://www.gnu.org/software/make/manual/html_node/Splitting-Recipe-Lines.html
