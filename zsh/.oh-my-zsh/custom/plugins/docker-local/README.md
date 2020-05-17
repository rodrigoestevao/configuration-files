# Docker (Local) plugin

This plugin adds some useful aliases and functions for [Docker](https://www.docker.com/) commands.

To use it, add `docker-local` to the plugins array in your zshrc file:

```zsh
plugins=(... docker-local)
```

## Aliases

 Alias   | Description
:--------|:---------------------------------------------------------------------
 dkprune | Clean up the unused volumes and containers
