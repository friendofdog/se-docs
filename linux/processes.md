Processes
=========

A process is just a piece of running code which is executing some task. It is active, in that it has been loaded into the system RAM and is being processed by the CPU.

Every process has...
- a process ID, `pid`
- a parent ID, `ppid`

With the exception of the init process, all processes are forked from another process.

The init process
----------------

When you boot the machine, it does a lot in kernel space. When this is done, it calls one thing in user space: the init process. Once that's done, the init system is responsible for starting all other processes in user space.

The init process is the only one without a parent. Its `pid` is `1` and `ppid` is `0`.

There are a number of init systems, including `systemd`, `upstart`, `sysvinit`, `launchd`, `bash`, and `openrc`. Ubuntu 18.04 uses bash.

Exec processes
--------------

Exec processes replace an existing process image with a new image. The current process dies and is replaced by the same process with the same PID; there is no child process created. The process will begin again starting at the top of the new image.

Fork and exec examples
----------------------

When you run `ls -l` in a terminal window, this happens:

- The parent process (in this case, a bash shell) is copied (fork)
- The copy (the child process) is replaced by `ls`
- The child process runs and then dies on completion (exec)

Forked processes inherit `stdin`, `stdout`, and `stderr` from the parent.

What about `exec ls -l`?

- Whatever is running in the current process stops, and the process runs `ls -l`
- The terminal window in which this is run will most likely close

Note that `exec` is not a direct evocation of an exec process, it's a shell command which triggers an exec process somewhere down the line

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

Useful commands in Linux
------------------------

- `ps -e | wc -l` count all processes
- `ps -e | grep Chrome` list all processes related to Chrome

Sources
-------

- https://www.youtube.com/watch?v=TJzltwv7jJs
