SSH
===

Key breakdown
-------------

When examining the public key of a remote server, something like the following will be returned:

`[size in bits] [encoding]:[fingerprint] [comment] [something printed by program evoking this info]`

Example:

`2048 SHA256:CxIuAEc3SZThY9XobrjJIHN61OTItAU0Emz0v/+15wY kevinkee@Kevins-MacBook-Pro.local (RSA)`

Encoding types
--------------

There are four types of encoding:

1. rsa
2. dsa
3. ecdsa
4. ed25519

If you use rsa, 4096 size is a good size for today. 2048 might be max supported in Japan or with some older systems.

ecdsa is quite common and is the best option for current applications. ed25519 is technically better but is not universally supported.

Generating keys
---------------

`ssh-keygen` is the command for creating new key pairs. When used, you must specify a type and the size of the key (in bytes). `ssh-keygen -t ecdsa -b 521` would create an ecdsa-encoded key of 521 bytes length.

SSH keys and config on Linux
----------------------------

`ssh-add` is the basic command for adding ssh keys to the authentication agent. The authentication agent itself might not run when a machine starts up; ``eval `ssh-agent -s` `` will get it started.

SSH can be configured on Linux in the `~/.ssh/config` file. This should be readable / writable by only the user (`chmod 600`). Below is a sample config file which loads the `some_key` private key for all hosts.

`IgnoreUnknown UseKeychain` is used in case `UseKeychain` is unrecognised (which it is on Ubuntu 18.04).

```
Host *
  IgnoreUnknown UseKeychain
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/some_key
```

Sources
-------

- https://www.phcomp.co.uk/Tutorials/Unix-And-Linux/ssh-check-server-fingerprint.html
- https://www.ssh.com/ssh/identity-key
- https://superuser.com/questions/421997/what-is-a-ssh-key-fingerprint-and-how-is-it-generated
- https://www.ssh.com/ssh/add
- https://www.ssh.com/ssh/keygen
