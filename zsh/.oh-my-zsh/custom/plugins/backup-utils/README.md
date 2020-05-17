# Backup Utils plugin

This plugin adds some useful aliases and functions for backup commands.

To use it, add `backup-utils` to the plugins array in your zshrc file:

```zsh
plugins=(... backup-utils)
```

## Aliases

Alias    | Description
:--------|:--------------------------------------------------------------------
bkp_home | Synchronize the $HOME dir on a given destination
