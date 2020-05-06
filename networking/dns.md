DNS
===

DNS is essentially a massive, distributed address book for IP addresses. When you type `example.com`, a DNS server will look up the address and send it back to your client.

Being distributed means that anyone can operate their own DNS server. A server can serve whatever the operator wants (be it correct or not).

DNS is a binary protocol (as opposed to http, which is a text protocol). For any data sent over DNS to be human-readable, it has to be decoded.

[UDP](transport.md#udp) is more conventional for DNS servers. `dig` will send a UDP packet to port 53.

Name servers
------------

A name server can be a caching or authoritative. These serve different functions, depending on the intention of a DNS query and where it is coming from.

See also: [Linux/named](../linux/named.md)

### Caching name server

A caching name server performs the DNS queries which a system makes, caching the results in memory. It is the "preferred DNS" in a given network (as we prefer that queries go here rather than, for example, an ISP).

Some sites might need to contact dozens of domains to load properly, so caching locally can reduce load time significantly. This also helps with applications which does a lot of DNS lookup, such as an email spam filter.

Answers given by caching name servers are generally not authoritative, as they are just storing info which was gathered from authoritative sources.

### Authoritative name server

An authoritative name server is a Start of Authority (SOA) for queries about a local domain. It answers queries from both local and remote networks.

In the context of a DNS lookup for an external website, an authoritative name server would be found at an ISP as opposed to a business or home network.

Lookup process
--------------

When a browser wants to fetch the address of a website, there are several places where that might be found. It checks the following sources in this order: local caches -> recursive DNS servers -> root DNS servers -> top level DNS servers -> authoritative DNS servers.

### Recursive DNS server

### Root DNS server

### Top level DNS server

### Authoritative DNS server

DNS request breakdown
---------------------

### Header

The header is 12 bytes (96 bits) long. It is divided various pieces of information, as seen below.

```
                              1  1  1  1  1  1
0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                      ID                       |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|QR|   Opcode  |AA|TC|RD|RA|   Z    |   RCODE   | (flags)
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    QDCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    ANCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    NSCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    ARCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
```

1. Transaction ID (16 bits): When server receives a request, it extracts this ID from the packet and sends it back in response. This allows us to confirm that the response received came from the server we requested from.

\#2 through \#9 are flags, and are 16 bits long in total

2. QR (1 bit): States whether message is a query (`0`) or a response (`1`).
3. Opcode (4 bits): States the kind of message the query is...
  - 0: a standard query (QUERY)
  - 1: an inverse query (IQUERY)
  - 2: a server status request (STATUS)
  - 3-15: reserved for future use
4. Authoritative answer (1 bit): Specifies whether DNS server which sends response is the DNS server which controls the domain name (as opposed to being a third party).
5. Truncation (1 bit): States whether or not the message was truncated (due to being larger than the allowed length, typically 512 bits for UDP).
6. Recursion desire (1 bit): Query from client to server asking if it offers recursion. If set, the server will act on the query recursively.
7.  Recursion available (1 bit): States whether the server has recursive query support.
8. Z (3 bits): Reserved for future use. Set to `000`.
9. Response code (4 bits): States whether the query as successful or not. Response codes are...
  - 0: No error condition
  - 1: Format error - The name server was unable to interpret the query.
  - 2: Server failure - The name server was unable to process this query due to a problem with the name server.
  - 3: Name Error - Meaningful only for responses from an authoritative name server, this code signifies that the domain name referenced in the query does not exist.
  - 4: Not Implemented - The name server does not support the requested kind of query.
  - 5: Refused - The name server refuses to perform the specified operation for policy reasons.  For example, a name server may not wish to provide the information to the particular requester, or a name server may not wish to perform a particular operation (e.g., zone transfer) for particular data.
  - 6-15: Reserved for future use.
10. Question count (16 bits): States the number of questions in the query. In practice, only one question is sent per query, so it's always "1" or `0000 0000 0000 0001`.
11. Answer count (16 bits): States the number of answers to query. This could be quite long if the domain name has a large number of records associated with it.
12. Name server count (16 bits): States the number of name servers returned.
13. Additional record count (16 bits): States number of resource records returned.

Sources
-------

- https://roadmap.sh/guides/dns-in-one-picture
- https://www.youtube.com/playlist?list=PLBOh8f9FoHHhvO5e5HF_6mYvtZegobYX2
- https://www.ietf.org/rfc/rfc1035.txt
- https://en.wikipedia.org/wiki/BIND
- https://en.wikipedia.org/wiki/SOA_record#Sample_SOA_record_in_BIND_syntax
- https://geekflare.com/linux-server-local-dns-caching/
