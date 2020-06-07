Port Exposure and Publishing
============================

By default, a Docker container is not exposed to any environment outside of itself and cannot be accessed directly. Instead, containers can be accessed by binding exposed container ports to host machine ports.

Exposing ports
--------------

Container ports can be exposed either using `EXPOSE` in the Dockerfile or `--expose` in runtime. `--expose` is more versitile, in that it can be used with ranges (e.g. `--expose=2000:3000`), and it will also overwrite anything declared with `EXPOSE`. For this reason, `EXPOSE` is sometimes used to merely demonstrate intent or serve as a default.

Regardless of the method used, exposing a container port alone does not mean that it can be accessed from the outside. For this to happen, exposed ports must published.

Port publishing
---------------

Ports bound using the below methods will be exposed on the host machine's IP address `0.0.0.0` (meaning it matches any IP on the system).

`-P` binds every exposed port in the container to a port on the host machine. The bound port on the host machine is random, but is within the range defined in `/proc/sys/net/ipv4/ip_local_port_range`. You can see the port bindings using `docker container port my-container`. If you just want to get the binding of a specific port/protocol, use `docker inspect --format='{{(index (index .NetworkSettings.Ports "53/tcp") 0).HostPort}}' my-container`.

`-p` is similar, but you can explicitly tell Docker to bind specific container ports to specific host machine ports. For example, `-p 1053:53` will bind container port `53` to host machine port `1053`. It can also handle port bindings for specific protocols (e.g. `-p 1053:53/udp`) or overwrite the default IP (e.g. `-p 127.0.0.5:1053:53`). A range of ports can also be bound; as in, `1234-1236:1234-1236/tcp`. (The ports only have to match when binding a range; otherwise, they do not have to match.) Ports do not have to be exposed beforehand; `-p` will take care of that as needed.

Sources
-------

- https://docs.docker.com/engine/reference/run/
- https://medium.com/better-programming/how-does-docker-port-binding-work-b089f23ca4c8
- https://www.ctl.io/developers/blog/post/docker-networking-rules
