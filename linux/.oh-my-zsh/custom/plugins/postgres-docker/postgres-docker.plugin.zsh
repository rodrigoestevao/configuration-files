# Aliases to control PostgreSQL running on Docker

alias startpost='docker run -d --rm --name postgres1 -e POSTGRES_PASSWORD=docker -p 5432:5432 -v ~/.local/var/lib/postgresql/postgres1/data:/var/lib/postgresql/data postgres'
alias stoppost='docker stop postgres1'
alias restartpost='stoppost && sleep 1 && startpost'