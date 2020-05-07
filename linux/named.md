Bind / named
============

BIND is the most widely used DNS server software and the de-facto standard for Linux systems. "Named" is commonly used interchangeably with "BIND", but named is in fact the daemon used by BIND while BIND is the package name.

Files and directories
---------------------

Below are the default locations for files and directories used by named.

`/etc/named.conf`: Main configuration file, which declares zones handled by this DNS server.

`/var/named`: For zone files. When a zone file location is declared, it is done so relative to this directory. Can be overwritten in the config file.

`/var/log`: Location where error messages are logged.

DNS lookup process
------------------

1. When a client sends a request to a DNS server running BIND, it looks in the config file to see if the queried zone is present
2. If the zone is present, query is pointed to the appropriate zone file in `/var/named`
3. An authoritative answer is sent back to the client

<img src="https://github.com/friendofdog/se-docs/raw/master/img/bind.png" width=500>

named.conf config file
----------------------

The config file does not itself contain zone information. It knows which zones are handled by the server and points queries to zone files, which have actual IP addresses and such. The syntax is similar to C++, so you will see things like `//` denoting comments.

Sample file:

```
options {
        directory "/var/lib/named";
        forwarders { 10.0.0.1; };
        notify no;
};

zone "localhost" in {
        type master;
        file "localhost.zone";
};

zone "0.0.127.in-addr.arpa" in {
        type master;
        file "127.0.0.zone";
};

zone "." in {
        type hint;
        file "root.hint";
};
```

### options

`directory`: Specifies working directory for named, and is the base directory for relative path references. Must be given as an absolute path. Default is `/var/named`.

`forwarders`: The name server to which queries should be forwarded if they cannot be resolved directly. Must be an IP address.

`forward`: `first` will forward query before attempting to resolve them using root name servers. `always` will forward query with no subsequent at resolving on root name servers (useful with firewalls).

`notify`: `no` prevents other name servers from being informed when changes are made to the zone data or when the name server is restarted.

### zone

`type`:
  `master`: Zone is handled by local name server
  `slave`: Zone is handled by another name server; must be used in conjunction with `masters`
  `hint`: Used with zone `.` to set name servers

`file`: Path to zone file. Path is relative to `directory`.

`masters`: Used with slave zones, specifies name server where the zone should be transferred. Must be IP address.

Sources
-------

- https://www.youtube.com/watch?v=-r5A-H5nxcA
- https://www.pks.mpg.de/~mueller/docs/suse10.1/suselinux-manual_en/manual/sec.dns.named.html
- http://web.mit.edu/rhel-doc/4/RH-DOCS/rhel-rg-en-4/s1-bind-namedconf.html
