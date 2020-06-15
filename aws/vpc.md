Virtual Private Cloud (VPC)
===========================

A VPC is a private network which is logically isolated from other private networks on the AWS Cloud. It follows the same concept as an on-premise network, in that a VPC is a secure network controlled by an administrator.

A VPC lives in a single region and can exist across multiple availability zones.

Every AWS account created after 2013 has a default VPC with a default subnet. Resources such as EC2 instances automatically launch into these defaults.

Key concepts
------------

### Subnets

AWS resources inside the VPC belong to subnets of the IP address of the VPC. For example, if your VPC's IP address is `10.10.0.0`, subnets would be `10.10.0.0/x` (where `x` is any number within a permitted range).

Subnets can be private or public. Private subnets are for resources used only within the VPC. Public subnets are for resources which must connect to the internet. For a subnet to be public, the VPC needs to be attached to an internet gateway.

By default, all subnets can communicate with each other. This can be controlled by route tables.

### Route tables

Route tables are sets of rules (routes) which dictate where traffic from a VPC is directed and how (through a gateway, network interface, or connection). Subnets are associated with the main route table by default, but can be configured to use other routes tables.

Accessing the internet
----------------------

The default VPC includes an internet gateway, and each default subnet within it is public. Instances launched into the default VPC will therefore have a public IP address.

Instances launched into VPCs other than the default will only have a private IP address (unless a public one is specified at launch or the subnet's public IP address is set). Internet access can be enabled by attaching an internet gateway to a subnet and associating an Elastic IP address with the instance.

### NAT devices

Using a NAT, a VPC instance can initiate outbound connections but unsolicited inbound connections are prevented. A NAT device is used to map multiple private IPv4 addresses to a single public IPv4 address. It has an Elastic IP address and using an internet gateway.

Security
--------

Security can be managed through security groups and network access control lists (ACL). A typical (good) security setup will take advantage of multiple layers of security.

Sources
-------

- https://docs.aws.amazon.com/vpc/latest/userguide/index.html
- https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat.html
