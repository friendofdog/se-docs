Unix-Computer Ecosystem
=======================

Unix system breakdown
---------------------

A Unix system consists of three parts: user space, kernel space, and hardware. User and kernel space both belong to system memory, while hardware is the physical components.

### User space

Contains all code that runs outside of the kernel: applications, utilities, and libraries which are accessible at the user level for the operating system to interact with the kernel. This includes everything from libc and bash to browsers. A.k.a. "userland".

### Kernel space

This is where the kernel executes and provides services. It contains higher-level functionality, such as process scheduling, memory management, and device mapping.

System vs. Function Calls
-------------------------

### System call

This is the entry point into the kernel. A program in user space can make a request for something to be executed in kernel space through systems calls. These include, for example, `open`, `read`, `write`, `close`, `wait`, `exec`, `fork`, `exit`, and `kill`.

System calls are typically not made directly, but through wrapper functions from GNU C Library (glibc) or some other similar library. For example, when a user types `chown 777 some-file.txt` he is actually running a wrapper function, which in turn copies the arguments and evokes the corresponding system call `chown` (incidentally, same name).

### Function call

A function call is a call to anything which is not the kernel. As mentioned above, this include wrapper calls which in turn make a system call.

<img src="https://github.com/friendofdog/se-docs/raw/master/img/ecosystem.png" width=500>

Sources
=======

1. https://en.wikipedia.org/wiki/User_space
2. http://www.linfo.org/kernel_space.html
3. https://www.usna.edu/Users/cs/aviv/classes/ic221/s16/lec/01/lec.html
4. https://unix.stackexchange.com/questions/87625/what-is-difference-between-user-space-and-kernel-space
5. http://man7.org/linux/man-pages/man2/intro.2.html
6. http://man7.org/linux/man-pages/man2/syscalls.2.html
