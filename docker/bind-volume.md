Bind Mounts and Volumes
=======================

Bind mount vs. volume
---------------------

Bind mounts are an older method. They store persistent data on the host system, which would otherwise be lost when the container closes. Bind mounts can exist anywhere on the host filesystem; therefore, they can be modified by processes other than Docker.

Volumes similarly store persistent data on the host, but they are managed by Docker. Volumes kept in a specific place on the host system (`/var/lib/docker/volumes/conf/_data` in some Linux distros). This means that when Docker changes some bound volume, it doesn't show up anywhere on the host system where you are not expecting it.

Mounting with command line
--------------------------

Mounts are created with the flag `-v` / `--volume` or with `--mount`. The main difference between the two is that `--mount` is more verbose while `-v` combines options into a single field.

The full syntax is `-v [target-on-host]:[dest-in-container]:[options]`. `target-on-host` can be a local file or folder (in case of bind mount) or a volume. If no `dest-in-container` is given, Docker will assume that it is the same as on host.

`--mount` is much more explicit. It works by providing a long string of key=value pairs. See [official documentation](https://docs.docker.com/storage/volumes/#choose-the--v-or---mount-flag) for a list.

[write something about options]

Permission and ownership inheritance
------------------------------------

The container mount will inherit user / group ownership from the host, regardness of whether or not the host's user / group exists in the container. In the very likely event that it does not, the container mount will simply set ownership to the UID / GID from the host.

Permissions will also be inherited from the host. Neither permissions nor ownership can be manually set during the mount process.

Sources
-------

- https://docs.docker.com/storage/volumes/
- https://docs.docker.com/storage/bind-mounts/

### Why permissions are an issue

- https://stackoverflow.com/questions/26500270/understanding-user-file-ownership-in-docker-how-to-avoid-changing-permissions-o/
- https://github.com/moby/moby/issues/7198
- https://github.com/moby/moby/issues/2259
- https://medium.com/@nielssj/docker-volumes-and-file-system-permissions-772c1aee23ca
