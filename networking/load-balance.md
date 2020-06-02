Load Balancing
==============

Load balancing aims to distribute workload across different computing resources. In an environment where a load balancer is present, the clients do not make connections with server-side resources directly. The load balancer takes incoming connections and creates a session between the client and an appropriate resource which it is "balancing".

The objectives in load balancing are to:

- improve fault tolerance and reliability
- minimise response time for a given task
- increase security
- avoid under-utilising or overloading a single resource

Resources connected to a load balancer are not necessarily servers. Although web servers are a classic use case, resoucres can be network links, computer clusters, or anything that could be used in workload distribution.

Security
--------

Because load balancers are the only publically accessible parts of their environemnts, the internet network is hidden from the public. Servers and other backend resources cannot be contacted directly by a client, providing a layer of security.
