Linux filesystem hierarchy structure
====================================

bin
- Contains binaries (a.k.a. "programs" or "applications")
- Common Linux commands like `ls` and `cat` are stored here

sbin
- System binaries, which non-admins would not see

boot
- Reponsible for booting up Linux
- Contains a lot of things you do not want to play around with

dev
- Handles devices and physical aspects of the system
- E.g. `sda` is a disk, and `sda1`, `sda2` and so forth are partitions

etc
- Stores system-wide configurations
- E.g. When you run `apt-get install`, it goes in here
- Sometime called "etcetera"

home
- Where users store their own applications and files

lib
- Contains libraries, which are various files that applications use for certain functions
- Required by binaries in `bin` and `sbin`

media and mnt
- For other mounted drives
- Media is a recent addition and will likely be where USB-mounted devices go
- If you're mounting manually, use `mnt`

opt
- Where user-installed softwares from vendors go

proc
- Contains pseudo-files, which contain information about system resources and processes
- Does not contain actual files, but kernel information represented as files
- Every process will have a folder here

root
- The root user's home folder
- Does not contain typical home directories inside

run
- A tempfs file system, which runs in RAM
- Everything inside is removed when system shuts down

snap
- Contains "snap" applications, which run differently than normal applications
- Common in Ubuntu

srv
- Where service data is stored (files which are accessed by external users)
- Usually empty unless your device is a server

sys
- The system folder, which allows you to interact with the kernel
- Similar to `run` in that it is not physically written to disk

tmp
- Contains temporary files used by a session
- Usually emptied when system reboots

usr
- User-specific application space (as opposed to `bin` which is for system)
- Sometimes called "user", other times called "unix system resource"
- Applications here are considered non-essential

var
- The "variable" directory, which contains files and directories expected to grow over time
