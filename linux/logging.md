Logging
=======

journald
--------

journald is the logging daemon found on newer Linux systems based on [systemd](./systemd.md). Its system log files are located in `/var/log/journal/`. Unlike syslog files, these cannot be read as text files. Instead, they can be inspected using the `journalctl` command.

The configuration for journald is in `/etc/systemd/journald.conf`. All options in this file are commented out by default and must be uncommented to take effect.

Useful args for journald:

`-r`: Displays newest entries first (reverses log entries).

`-f`: Keeps `journalctl` running, updating entries as they are appended to journal. Displays newest entries first.

`-b [int]`: Displays entries from the most recent system boot. Providing an integer will show specific logs. Positive ints will show logs starting from oldest (`n=1`) to newest (`n=1++`); a negative int will go from newest (`n=-1`) to oldest (`n=-1--`).

`-u [service]`: Displays entries related to a given service. E.g. `journalctl -u docker` will display logs related to Docker.

syslog
------

syslog is an older logging daemon on Linux systems running init (as opposed to systemd). Unlike journald, logs can be read as if they were text files (using `cat`, `less`, etc.).
