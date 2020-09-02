# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# PostgreSQL related zsh aliases for instances running on Docker
#
# Adopted pgd prefix for aliases and functions
alias pgdclean='docker system prune -f --volumes'
if [ -e ~/.local/etc/postgresql/postgresql.conf ]; then
    alias pgdstart='pgdclean; docker run -d --rm --name postgres1 -e POSTGRES_PASSWORD=docker -p 5432:5432 -v ~/.local/var/lib/postgresql/postgres1/data:/var/lib/postgresql/data -v ~/.local/etc/postgresql/postgresql.conf:/etc/postgresql/postgresql.conf postgres -c "config_file=/etc/postgresql/postgresql.conf"'
else
    alias pgdstart='pgdclean; docker run -d --rm --name postgres1 -e POSTGRES_PASSWORD=docker -p 5432:5432 -v ~/.local/var/lib/postgresql/postgres1/data:/var/lib/postgresql/data postgres'
fi
alias pgdstop='docker stop postgres1 2> /dev/null'
alias pgdrestart='pgdstop && sleep 1 && pgdstart'
