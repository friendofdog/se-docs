Python `socket` Module
======================

`import socket`

The socket module is used to connect nodes (or "sockets") over a network. In other words, it's what we use to run a Python server.

A typical use case would be to run a server inside an infinite loop. For example:

```
import socket    

s = socket.socket()          
port = 12345                
s.bind(('', port))         
s.listen(5)      

while True:
   c, addr = s.accept()      
   c.send('Thank you for connecting')
   c.close()
```

Useful functions:
- `socket.AF_INET`: send data over IPv4 (as opposed to IPv6)
- `socket.SOCK_DGRAM`: uses UDP (as opposed to TCP)
- `bind()`: binds ______
  - takes one parameter, which is why IP and port have to be passed like `sock.bind((ip, port))`
- `racvform(bytes)`: returns an array, `[data, address]`, and takes an int (number of bytes)
- `sendto(response, address)`: sends response
  - `data` has to be in bytes

Sources
-------

- https://www.geeksforgeeks.org/socket-programming-python/
- https://docs.python.org/3/howto/sockets.html
