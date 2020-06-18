# Python Utils plugin

This plugin adds some useful aliases and functions for [Python](https://www.python.org/) commands.

To use it, add `python-utils` to the plugins array in your zshrc file:

```zsh
plugins=(... python-utils)
```

## Aliases

Alias         | Description
:-------------|:----------------------------------------------------------------
py_git_init   | Initialize a git repository, if does not exists and create a default .gitignore file
py_create_env | Create a virtual environment and install all packages if a requirements file is found or informed via `-r FILE` parameter.
