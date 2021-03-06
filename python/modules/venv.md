`venv` module
=============

A.k.a. `virtualenv` (in Python2), `venv` is used to create a lightweight virtual environment (VE). It is initialised using `python3 -m venv /path/to/project/env`. `env` is the folder in which the VE will live.

PyCharm uses `venv` be default when it sets up a VE.

A VE instance will have its own Python binary. That binary will match the version of the binary used to create the instance. For example, if 3.5 is used to create the instance the instance binary will also be 3.5.

Upon initialisation, a VE folder will be created and populated. It will look something like the following:

```
├── bin
│   ├── activate
│   ├── activate.csh
│   ├── activate.fish
│   ├── easy_install
│   ├── easy_install-3.5
│   ├── pip
│   ├── pip3
│   ├── pip3.5
│   ├── python -> python3.5
│   ├── python3 -> python3.5
│   └── python3.5 -> /Library/Frameworks/Python.framework/Versions/3.5/bin/python3.5
├── include
├── lib
│   └── python3.5
│       └── site-packages
└── pyvenv.cfg
```

The symlinks `python`, `python3`, and `python3.5` all point to the system binary.

The activate script (usually `env/bin/activate`) sets up the shell to use the VE. It is a bash script, so simple run `source env/bin/activate`. The prompt will be prefixed by `(env)` and you will be working in the VE. Run `deactivate` to exit.

Warning: there is a bug where aliasing `python` and `pip` on MacOS causes pip to install packages globally in VE. For example, do not to the following:

```
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
```

Package management
------------------

Packages installed using `pip` will be specific to the VE. To make these packages available outside the VE `pip freeze > requirements.txt`. Running `pip install -r requirements.txt` in another VE will install the relevant packages.

Support module: `virtualenvwrapper`
-----------------------------------

This module helps manage workflows while using `venv`, namely in creating and deleting virtual environments and switching between them in development.

Sudo and venv
-------------

When you use `venv`, it's basically updating the `$PATH` variable to look in the virtual environment `/bin` directory before looking elsewhere when running `python` and similar commands. `sudo`, however, ignores `$PATH`; therefore, it does not cooperate well with virtual environments.

One workaround is to use the full path to the virtual environment Python executable, for example, `sudopy = sudo /project-directory/venv/bin/python`. Unfortunately, the `venv` does not have any apparent way to do this natively.

Sources
-------

- https://realpython.com/python-virtual-environments-a-primer/
- https://virtualenvwrapper.readthedocs.io/
- https://unix.stackexchange.com/questions/83191/how-to-make-sudo-preserve-path
