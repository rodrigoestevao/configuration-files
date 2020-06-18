# Python Utils plugin

This plugin adds some useful aliases and functions for [Python](https://www.python.org/) commands.

To use it, add `python-utils` to the plugins array in your zshrc file:

```zsh
plugins=(... python-utils)
```

## Aliases

Alias         | Description
:-------------|:----------------------------------------------------------------
pyactivateenv | Try to activate a virtual environment found through the current path
pygitinit     | Initialize a git repository, if does not exists and create a default .gitignore file
pycreateenv   | Create a virtual environment and install all packages if a requirements file is found or informed via `-r FILE` parameter.
