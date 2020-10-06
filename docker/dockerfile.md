Dockerfile
==========

A Dockerfile is a text file containing commands used to assemble an image. It does not start containers or run anything; the soul purpose is to create an image which can in turn be used for other things.

The "build" process
-------------------

This process of creating an image is called a "build", initiated using `docker build`. During a build, these instructions are run in succession from top to bottom (similar to [make](../linux/make.md)). Each execution is a "step", and steps are completely independent of each other.

A build consists of both the Dockerfile and the context (that is, the files present at the build location). The location, which is a required argument to `docker build`, can be `PATH` (directory on local filesystem) or `URL` (a git repository location). The Dockerfile does not have to be in the location, but usually is. A common situation is to use `docker build .`, which builds using CWD and assumes that Dockerfile is also in CWD.

Some flags include:

`-f`: path to Dockerfile
`-t`: add tag to image after successful build (can use multiple times in same command)

Command list
------------

Below is a list of commands which can be used in Dockerfile. This is a very brief summary. For more details, there is a cheat sheet available [here](https://kapeli.com/cheat_sheets/Dockerfile.docset/Contents/Resources/Documents/index.)

`FROM`: specifies the parent image from which you are building; must be first instruction in file

[deprecated] `MAINTAINER`: sets author for generated images

`RUN`: runs a command in the Docker container

`CMD`: provide defaults for an executing container; can only be one per Dockerfile

`ENTRYPOINT`: defines a container to run as a specific executable; can only be one per Dockerfile

`LABEL`: adds metadata to an image

`EXPOSE`: instruction informs Docker that the container listens on the specified network ports at runtime, but does not actually publish the port (do this using `-p` or `-P` flags during `docker run`)

`ENV`: sets environment variables, which can be used in subsequent commands

`ADD`: copies files, URLs, or directories from local machine to Docker container

`COPY`: copies files, or directories from local machine to Docker container

`VOLUME`

`USER`

`WORKDIR`

`ARG`

`ONBUILD`

`STOPSIGNAL`

`HEALTHCHECK`

`SHELL`

### Shell and exec forms

The commands `RUN`, `CMD`, `ENTRYPOINT`, and `SHELL` can be run in the shell or exec form. Syntactically, these can be recognised easily: shell looks like `<command> ... ...` and exec is parsed as a JSON array so it looks like `<command> [ "...", "..." ]`.

Shell evokes the command shell. By default this is `/bin/sh -c` on Linux or `cmd /S /C on` Windows.

Exec does not invoke a command shell, and is considered the more desirable form. It does not have access to things like environment variables, so `RUN [ "echo", "$HOME" ]` would not know what the value of `$HOME` is.

### Comparing similar commands

#### `ADD` vs `COPY`

`ADD` and `COPY` both move resources from the host machine (or git repository) to the Docker container. `ADD` can do several things that `COPY` cannot:

- If resource at source is a tar file, it unpacks this as a directory at destination
- If resource is a URL without a trailing slash, it will download the URL to the destination

#### `RUN` vs `CMD` vs `ENTRYPOINT`

From [article](https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/) by Yury Pitsishin:

>`RUN` executes command(s) in a new layer and creates a new image. E.g., it is often used for installing software packages.
>`CMD` sets default command and/or parameters, which can be overwritten from command line when docker container runs.
>`ENTRYPOINT` configures a container that will run as an executable.

[incomplete, pick up here]

Sources
-------

- https://docs.docker.com/engine/reference/builder/
- https://kapeli.com/cheat_sheets/Dockerfile.docset/Contents/Resources/Documents/index
- https://goinbigdata.com/docker-run-vs-cmd-vs-entrypoint/
