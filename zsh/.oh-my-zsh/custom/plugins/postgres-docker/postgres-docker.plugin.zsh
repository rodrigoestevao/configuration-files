# Author: Rodrigo Estevao
# https://github.com/rodrigoestevao/
#
# PostgreSQL related zsh aliases for instances running on Docker
#
# Adopted pgd prefix for aliases and functions
alias pgdstart='docker run -d --rm --name postgres1 -e POSTGRES_PASSWORD=docker -p 5432:5432 -v ~/.local/var/lib/postgresql/postgres1/data:/var/lib/postgresql/data postgres'
alias pgdstop='docker stop postgres1'
alias pgdrestart='stoppost && sleep 1 && startpost'