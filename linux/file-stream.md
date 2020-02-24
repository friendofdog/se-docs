Standard File Streams
=====================

Standard streams are input / output (I/O) communication between a program and its environment. When a program is run in Unix, three standard file streams (a.k.a. "standard file descriptors") are evoked. Information from these streams is returned usually to a terminal in which the program was executed.

1. Standard Input
  - File stream `stdin`, file descriptor 0
  - The primary input stream for reading information printed to the terminal
2. Standard Output
  - File stream `stdout`, file descriptor 1
  - The primary output stream for printing information and program output to the terminal
3. Standard Error
  - File stream `stderr`, file descriptor 2
  - The primary error stream for printing information to the terminal that resulted from an error in processing or should not be considered part of the program output.

Sources
=======

1. https://www.putorius.net/linux-io-file-descriptors-and-redirection.html
