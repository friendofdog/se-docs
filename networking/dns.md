DNS
===

DNS is essentially a massive, distributed address book for IP addresses. When you type `example.com`, a DNS server will look up the address and send it back to your client.

Being distributed means that anyone can operate their own DNS server. A server can serve whatever the operator wants (be it correct or not).

DNS is a binary protocol (as opposed to http, which is a text protocol). For any data sent over DNS to be human-readable, it has to be decoded.

[UDP](transport.md#udp) is more conventional for DNS servers. `dig` will send a UDP packet to port 53.
