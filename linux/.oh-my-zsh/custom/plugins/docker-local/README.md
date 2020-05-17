# Docker (Local) plugin

This plugin adds some aliases for useful Docker commands.

To use it, add `docker-local` to the plugins array in your zshrc file:

```zsh
plugins=(... docker-local)
```

## Aliases

 Alias   | Command                                               | Description                                
---------|-------------------------------------------------------|--------------------------------------------
 dkprune | `docker volume prune -f && docker container prune -f` | Clean up the unused volumes and containers 
