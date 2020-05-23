`socket` Module
===============

`import socket`

The socket module is used to connect nodes (or "sockets") over a network. In other words, it's what we use to run a Python server.

A simple server example
-----------------------

A typical use case would be to run a server inside an infinite loop. For example:

```python
import socket    

# create a new socket using AF_INET address family, SOCK_STREAM socket type
# AF_INET and SOCK_STREAM are the defaults, so they are not actually needed here
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# bind the socket to address 127.1.2.3 on port 1234
# this means that data sent to 127.1.2.3 on port 1234 will be picked up
s.bind(('127.1.2.3', 1234))

# enables the server to accept connections
# 5 is the number of unaccepted connections that the system will allow before refusing new connections
s.listen(5)

while True:
    # accepts new connections
    # conn is a new socket objects which can be used to send and receive data over the connection
    # addr is the address which on the other end of the connection
    conn, addr = s.accept()

    # sends date to the conn object
    conn.send('Thank you for connecting')

    # closes the connection
    conn.close()
```

Common errors
-------------

- SIGPIPE: Shows as `socket.error: [Errno 32] BrokenPipeError`. This error occurs when a process tries to write to a socket that has already received an [RST](https://www.pico.net/kb/what-is-a-tcp-reset-rst) packet.
- `OSError: [Errno 98] Address already in use`: [find out what this is, write it up]

Sources
-------

- https://www.geeksforgeeks.org/socket-programming-python/
- https://docs.python.org/3/howto/sockets.html
- https://dzone.com/articles/sigpipe-python
