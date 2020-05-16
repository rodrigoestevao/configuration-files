# Postgres plugin

This plugin adds some aliases for useful Postgres commands.

:warning: this plugin works exclusively with Postgres installed on Docker 
because Postgres paths are hardcoded to `/usr/local/var/postgres`.

To use it, add `postgres-docker` to the plugins array in your zshrc file:

```zsh
plugins=(... postgres-docker)
```

## Aliases

| Alias       | Command                                                                         | Description                                                 |
|-------------|---------------------------------------------------------------------------------|-------------------------------------------------------------|
| startpost   | `docker run -d --rm --name postgres1 -e POSTGRES_PASSWORD=docker -p 5432:5432 -v ~/.local/var/lib/postgresql/postgres1/data:/var/lib/postgresql/data postgres` | Start postgres server                                       |
| stoppost    | `docker stop postgres1`                             | Stop postgres server                                        |
| restartpost | `stoppost && sleep 1 && startpost`                                              | Restart (calls stop, then start)                            |
