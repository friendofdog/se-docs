Git and File Permissions
========================

Git can track file permissions, but only does so for the executable bit for the user who owns the file. Permissions other than execute are not tracked.

By default, permission tracking is active. To deactivate, include the following in the git config file:

```
[core]
    filemode = false
```

... or use in command line: `git config core.filemode true`.

Sources
-------

- https://medium.com/@tahteche/how-git-treats-changes-in-file-permissions-f71874ca239d
- https://stackoverflow.com/questions/10516201/updating-and-committing-only-a-files-permissions-using-git-version-control
