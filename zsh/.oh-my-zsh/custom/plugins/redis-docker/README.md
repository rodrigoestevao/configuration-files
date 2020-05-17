# Python Utils plugin

This plugin adds some useful aliases and functions for [Redis](https://redis.io/) commands.

To use it, add `redis-docker` to the plugins array in your zshrc file:

```zsh
plugins=(... redis-docker)
```

## Aliases

Alias     | Description
:---------|:--------------------------------------------------------------------
rdstart   | Start Redis server
rdstop    | Stop Redis server
rdrestart | Restart (calls stop, then start)
