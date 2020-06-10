Elastic Load Balancer
=====================

The main function of an Elastic Load Balancer (ELB) is to manage and control the flow of inbound requests to groups of targets, by distributing requests across the targeted resource group. This is commonly, but not necessarily, EC2 instances; it could also be Lambda functions or IP addresses. Targets can be in muliple availability zones or just one.

Types of load balancers
-----------------------

Application Load Balancer is the newest kind of load balancer offered by Elastic Load Balancing service. It operates at the request level. Enhanced features include: supported protocols, CloudWatch metrics, access logs, health checks. New features include: path / host based routing, native IPv6 support (in a VPC), AWS WAF, dynamic ports, deletion protection, request tracing.

Network Load Balancer is for ultra-high performance with very low latency. Operates at the connection level, routing traffic to targets in a VPC. Can handle millions of requests per second.

Classic Load Balancer is a legacy load balancer intended for applications built with the Classes EC2 environment.

Concepts
--------

Listener: a process that checks for connection requests using the configured protocol and port. The load balancer will route requests to targets (in one or more target groups) based on the rules you define.

Target: a destination for traffic based on listener rules. This is not an instance (load balancers cannot register instances directly).

Target group: routes requests to one or more registered targets using specified protocol and port. A target may belong to multiple groups. Health checks can be applied to target groups.

Path-based routing: allows you to route to different groups based on URL in the request.

Host-based routing: allows you to have multiple domains supported a single load balancer.

Health check: a check performed on a target group to evaluate resources in that group. It contacts each target in the group using a specified protocol to receive a response. If no response is received in an allotted time period, the ELB will mark the target as unhealthy and stop sending traffic there.

ELB and availability zones
--------------------------

When an availability zone is enabled for a load balancer, a node is created in that zone. This is the tool which is responsible for the distribution of traffic. A node must be associated with every zone which you want traffic routed to.

Cross-zone load balancing distributes traffic across all targets within multiple availability zones. Without this enabled, traffic would merely be distributed evenly between zones (regardless of how many targets were in those zones).

Use cases
---------

Use a container to host microservices, and route to those services from a single load balancer. The following example shows three applications running on the same instance, accessible through different paths based on the port.

<img src="https://github.com/friendofdog/se-docs/raw/master/img/alb-1.png" width=500>

Route traffic to and organise backend targets. Listeners will route requests received by the load balancer based on rules. Target groups are used to perform health checks and also register targets to the load balancer.

<img src="https://github.com/friendofdog/se-docs/raw/master/img/alb-2.png" width=500>

Sources
-------

- https://docs.aws.amazon.com/elasticloadbalancing/index.html
- https://youtu.be/uTrpk-atNFc
- https://www.aws.training/Details/eLearning?id=29701
