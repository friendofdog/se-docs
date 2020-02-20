Processes
=========

A process is just a piece of running code which is executing some task. Every process has...
- a process ID, `pid`
- a parent ID, `ppid`

With the exception of the init process, all processes are forked from another process.

The init process
----------------

When you boot the machine, it does a lot in kernel space. When this is done, it calls one thing in user space: the init process. Once that's done, the init system is responsible for starting all other processes in user space.

The init process is the only one without a parent. Its `pid` is `1` and `ppid` is `0`.

There are a number of init systems, including `systemd`, `upstart`, `sysvinit`, `launchd`, `bash`, and `openrc`. Ubuntu 18.04 uses bash.

Fork and exec examples
----------------------

When you run `ls -l` in a terminal window, this happens:
- The parent process (in this case, a bash shell) is copied (fork)
- The copy (the child process) is replaced by `ls`
- The child process runs and then dies on completion (exec)

What about `exec ls -l`?
- The same thing happens, except the child process replaces the parent (not the forked copy)
- Therefore, the parent process is die (in this case, the terminal window will close)

Forked processes inherit `stdin`, `stdout`, and `stderr` from the parent.

Process signals
---------------

Keyboard shortcuts for processes running in foreground:
- Ctrl+C = `SIGINT` (interrupts process)
- Ctrl+\\ = `SIGQUIT` (quits process)
- Ctrl+Z = `SIGTSTP` (suspends process)
- `kill -l` gives you a list of signals

Ending processes with `kill`, in order or severity:
- `kill -15 [pid]` sends `SIGTERM`
	- `kill [pid]` does same thing
- `kill -2 [pid]` sends `SIGINT`
- `kill -1 [pid]` sends `SIGHUP`
- `kill -9 [pid]` sends `SIGKILL`
	- This gives the process no chance to clean up before shutdown
	- Can never fail

Sources
-------

- https://www.youtube.com/watch?v=TJzltwv7jJs
