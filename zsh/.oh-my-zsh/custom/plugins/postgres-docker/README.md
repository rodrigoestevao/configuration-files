# Postgres (Docker) plugin

This plugin adds some useful aliases and functions for Postgres commands.

To use it, add `postgres-docker` to the plugins array in your zshrc file:

```zsh
plugins=(... postgres-docker)
```

## Aliases

Alias      | Description
:----------|:-------------------------------------------------------------------
pgdstart   | Start postgres server
pgdstop    | Stop postgres server
pgdrestart | Restart (calls stop, then start) 
