# Postgres (Docker) plugin

This plugin adds some aliases for useful Postgres commands.

To use it, add `postgres-docker` to the plugins array in your zshrc file:

```zsh
plugins=(... postgres-docker)
```

## Aliases

| Alias      | Command                                                                                                                                                        | Description                      |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------|
| pgdstart   | `docker run -d --rm --name postgres1 -e POSTGRES_PASSWORD=docker -p 5432:5432 -v ~/.local/var/lib/postgresql/postgres1/data:/var/lib/postgresql/data postgres` | Start postgres server            |
| pgdstop    | `docker stop postgres1`                                                                                                                                        | Stop postgres server             |
| pgdrestart | `stoppost && sleep 1 && startpost`                                                                                                                             | Restart (calls stop, then start) |
