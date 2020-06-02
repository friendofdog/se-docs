Permissions
===========

Docker needs to be run by a user with root access or one which is part of a permitted group.

`sudo docker [whatever]` works in most cases (assuming a user can `sudo`). However, `sudo` can complicate things. For example, sudo makes the `PWD` environment variable unavailable. This is problematic for things like volumes and binding, which sometimes rely on paths relative to where a command is being executed.

A better way is to add users to a group which can run Docker. When you install Docker it creates a group, `docker`. Simply adding users to this group will do the trick.

`sudo usermod -aG docker [non-root user]`
