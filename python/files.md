Files
=====

Reading files
-------------

To get a file for use in a script, use `open()`. A text file, somefile.txt, contains the following:

```
This is some text
Here is line two
And finally line three
```

`some_file =  open('somefile.txt')` fetches the contents and stores in a variable.

`read()` and `readlines()` output the contents of the file into the console, starting at the beginning of the file and moving to the end. `some_file.read()` would return the entire content the first time, but nothing the second time as the position is at the end of the file. `seek(0)` resets position to `0` (the start of file).

Upon reading the file, Python will continue to have file open until `close()` is evoked. To get around this, the file can be opened as a variable:

```
with open('somefile.txt') as another_file:
  print(another_file.read())
```

Read / write modes of `open`
----------------------------

`mode='r'`  read only
`mode='w'`  write only (overwrites existing file or creates new one)
`mode='a'`  append only
`mode='r+'` read and write
`mode='w+'` write and read (overwrites existing file or creates new one)

For example, to append a line to an existing file:

```
with open('somefile.txt', mode='a') as another_file:
  another_file.write('\nThis is another line')
```

`seek()` is useful when appending to files. You can append content to a text file, for example, at the beginning by using `seek(0)` before appending.

Creating file with cell magic
-----------------------------

```
%%writefile -a somefile.txt
One line
Another line
```

The above will do exactly as it imples: create a file in the `pwd` with the name `somefile.txt` with the two stated lines of content.

Cell magic are specific to IPyhon kernel. This works on Jupyter.
