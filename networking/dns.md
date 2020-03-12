DNS
===

DNS is essentially a massive, distributed address book for IP addresses. When you type `example.com`, a DNS server will look up the address and send it back to your client.

Being distributed means that anyone can operate their own DNS server. A server can serve whatever the operator wants (be it correct or not).

DNS is a binary protocol (as opposed to http, which is a text protocol). For any data sent over DNS to be human-readable, it has to be decoded.

[UDP](transport.md#udp) is more conventional for DNS servers. `dig` will send a UDP packet to port 53.

Lookup process
--------------

When a browser wants to fetch the address of a website, there are several places where that might be found. It checks the following sources in this order: local caches -> recursive DNS servers -> root DNS servers -> top level DNS servers -> authoritative DNS servers.

### Recursive DNS server

### Root DNS server

### Top level DNS server

### Authoritative DNS server

Sources
-------

- https://roadmap.sh/guides/dns-in-one-picture
- https://www.youtube.com/playlist?list=PLBOh8f9FoHHhvO5e5HF_6mYvtZegobYX2
