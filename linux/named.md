Bind / named
============

BIND is the most widely used DNS server software and the de-facto standard for Linux systems. "Named" is commonly used interchangeably with "BIND", but named is in fact the daemon used by BIND while BIND is the package name.

Files and locations
-------------------

- `/etc/named.conf`: main configuration file, which declares zones handled by this DNS server
- `/var/named`: collection of zone files, each one pointed to by the config file
- `/var/log`: for error messages

DNS lookup process
------------------

1. When a client sends a request to a DNS server running BIND, it looks in the config file to see if the queried zone is present
2. If the zone is present, query is pointed to the appropriate zone file in `/var/named`
3. An authoritative answer is sent back to the client

<img src="https://github.com/friendofdog/se-docs/raw/master/img/bind.png" width=500>

named.conf config file
----------------------

The config file does not itself contain zone information. It knows which zones are handled by the server and points queries to zone files, which have actual IP addresses and such. The syntax is similar to C++, so you will see things like `//` denoting comments.

Sources
-------

- https://www.youtube.com/watch?v=-r5A-H5nxcA
