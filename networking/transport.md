Transport Protocols
===================

Transport layer
---------------

Within a packet, UDP / TCP are part of the transport layer.

<img src="https://github.com/friendofdog/se-docs/raw/master/img/packet-transport.png" width=500>

The transport layer creates ~65,000 ports on the server. This is what allows multiple applications to use a single network connection at the same time. Applications can reserve certain ports for exclusive use.

### Segments

When an application creates a message, it makes its way to the transport layer and is wrapped in a segment. The segment contains additional information, including source port and destination port. On the receiving server, the segment is unwrapped and delivered to the relevant port.

UDP vs. TCP
-----------

### UDP
- Small packet sizes, with 8-byte headers
- Connectionless: no connection needed before sending out data
- Message oriented: data is sent out in distinct chunks, sent in FIFO order
- More control over when data is sent out
- Primitive form of error detections: has a 16-bit checksum but it is not very reliable
  - Makes no attempt to recover from data corruption or lost packets
  - Checksum only mandatory for IPv6
- No check to make sure packets arrive in the order they were sent
- No congestion control; packets are sent out regardless of how busy network is
- Good for DNS, small Q&A transactions, and situations where some packet loss is not an issue

### TCP
- Transmission Control Protocol
- Larger packet sizes, with 20-byte headers
- Connection-based: connection must be negotiated first before doing anything
  - Three-way handshake: initiator asks acceptor if it will accept -> acceptor says yes or no -> initiator sends packet
  - Allows such things as delivery acknowledgement
- Steam oriented: uses a continuous flow of data, sent in no particular order
- Re-transmits dropped packets (such as when no acknowledgement is received from acceptor)
- Arranges packets in the correct order, even if they are received out of order
- Controls congestion when network is busy
  - Downside is that data is not always sent out immediately (bad for things like VOIP)
- Better error detection: while not technically superior to UDP, checksum is mandatory for IPv4 and IPv6
- Good for file transfer, remote access (SSH), or where delivery acknowledgement is needed
