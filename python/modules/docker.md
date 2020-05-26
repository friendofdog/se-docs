`docker` Module
===============

The `docker` module is used to manage Docker processes using the Docker Engine API. It is used to do pretty much anything that could otherwise be done directly through Docker, except in Python code.

Container management
--------------------

First, the Docker client has to be started. The basic command for doing this is `client = docker.from_env()`.

A container can be started using the client. The following is the equivalent of a `docker run` command starting up a `capps-bind` container. Options line up with their command line counterparts.

```python
dns_server = client.containers.run(
    'capps-bind:test',
    volumes={'./tconfig/': {'bind': '/etc/bind', 'mode': 'rw'}},
    ports={'53/tcp': 1053, '53/udp': 1053},
    user='root:named',
    detach=True,
    remove=True
)
```

Note that `ports` has to explicitely declare a protocol. On command line, `tcp` would have been implicit as default.

A container can be stopped simply by running `dns_server.stop()`. If you want to stop all containers, this can be done in a simple loop:

```python
for container in client.containers.list():
  container.stop()
```

Sources
-------

- https://docs.docker.com/engine/api/
- https://docker-py.readthedocs.io/en/stable/index.html
