Version Control
===============

macOS comes with Python2 as the system default. Support for this version expired in January 2020. To utilise Python3, Python3 needs to be installed and thereafter version controlled.

The best way to do this is with Brew. The Brew `python` package is for Python3, so installation can be handled with the command `brew update && brew install python`. Future updates can be done with `brew update && brew upgrade python`.

`python3` and `pip3` are now available, but `python` and `pip` still point to Python2 binaries. If you want to change this, add the following aliases to `.bash_profile`:

```
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
```

Sources
-------

https://opensource.com/article/19/5/python-3-default-mac
