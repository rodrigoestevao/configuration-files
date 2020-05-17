# Python Utils plugin

This plugin adds some useful aliases and functions for [Python](https://www.python.org/) commands.

To use it, add `python-utils` to the plugins array in your zshrc file:

```zsh
plugins=(... python-utils)
```

## Aliases

Alias     | Description
:---------|:--------------------------------------------------------------------
rbstart   | Start RabitMQ server
rbstop    | Stop RabitMQ server
rbrestart | Restart (calls stop, then start)
