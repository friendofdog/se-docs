Git Commands
============

`git add`
---------

Adds file contents to the index. Files in index are included in commits.

`git add .` will add all diffs to the index indiscriminately. A safer way is to chain filenames, like `git add index.html styles.css`. You can also use wildcards, such as `git add *.js` to add all JavaScript files in the current directory.

Flags:

- `-i, --interactive`: interactive mode
- `-e, --edit`: edit mode; opens diff vs. the index in editor, allowing files to be edited prior to being added
- `-p, --patch`: patch mode; adds changes in chunks (instead of adding all changes to file)

`git show`
----------

Shows various types of objects.

It is commonly used to print the contents of a commit. The default argument is `HEAD` so if run with no args it will print the latest commit. It can also take `HEAD~2` or a commit hash to show contents of a specific commit.

Flags:

- `--summary`: summary; only the summary is printed
- `--oneline`: one line; prints on one line and abbreviates commit info (does not always work as expected)

Sources
-------

- https://johnkary.net/blog/git-add-p-the-most-powerful-git-feature-youre-not-using-yet/
- https://git-scm.com/docs/git-add
- https://git-scm.com/docs/git-show
