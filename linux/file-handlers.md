File Handlers
=============

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

Sources
-------

- http://edoceo.com/howto/bash
