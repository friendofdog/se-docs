Startup Scripts
===============

### Login shell

Used to set up user-specific settings in bash.

Parts of a login shell:
1. `/etc/profile` – bash looks for this first, proceeds if so
2. `~/.bash_profile` – this is first priority; if found, bash will not proceed
3. `~/.profile` – second priority
4. `~/.bash_login` – final priority; this is not commonly used

### Non-login shell

Used to set up configurations which apply to all users.

Parts of a non-login shell:
1. `/etc/bash.bashrc`
2. `~./bashrc` – used for bash configuration (e.g. aliases)
