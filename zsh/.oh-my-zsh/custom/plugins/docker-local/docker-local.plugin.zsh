# Authors: Rodrigo Estevao
# https://github.com/rodrigoestevao
#
# Docker related zsh aliases
#
# Adopted dk prefix for aliases and functions

alias dkprvol='docker volume prune -f'
alias dkprcon='docker container prune -f'
alias dkprnet='docker network prune -f'
alias dkprimg='docker image prune -f'
alias dkprsys='docker system prune -f'
alias dkprall='dkprsys && dkprvol'
alias dkpsall='docker ps --all'
