File Descriptors
================

Standard File Streams
---------------------

Standard streams are input / output (I/O) communication between a program and its environment. When a program is run in Unix, three standard file streams (a.k.a. "standard file descriptors") are evoked. Information from these streams is returned usually to a terminal in which the program was executed.

1. Standard Input
  - File stream `stdin`, file descriptor 0
  - The primary input stream for reading information printed to the terminal
2. Standard Output
  - File stream `stdout`, file descriptor 1
  - The primary output stream for printing information and program output to the terminal
3. Standard Error
  - File stream `stderr`, file descriptor 2
  - The primary error stream for printing information to the terminal that resulted from an error in processing or should not be considered part of the program output.

Sources
-------

- https://www.putorius.net/linux-io-file-descriptors-and-redirection.html
- https://en.wikipedia.org/wiki/File_descriptor





```
$ set -o vi

# write character ")" to file called "z"
$ echo ')' >z

# hex dump z, you get ")" in hex plus the linefeed
$ xxd z
00000000: 290a                                     ).

# do same thing again, but use -n to suppress newline
$ echo -n ')' >z && xxd z
00000000: 29                                       )

# -e causes \n to be interpreted as a newline
$ echo -en ')\n' >z && xxd z
00000000: 290a                                     ).

# without -e, \n is interpreted as a literal
$ echo -n ')\n' >z && xxd z
00000000: 295c 6e                                  )\n
```
