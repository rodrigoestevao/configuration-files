# Authors: Rodrigo Estevao
# https://github.com/rodrigoestevao
#
# Redis related zsh aliases
#
# Adopted rd prefix for aliases and functions

alias rddclean='docker system prune -f --volumes'
# alias rddstart='rddclean; docker run -d -p 6379:6379 --name redis1 --restart unless-stopped -v $HOME/.local/var/lib/redis/redis1:/data redis'
alias rddstart='rddclean; docker run -d --rm --name redis1 -p 6379:6379 -v $HOME/.local/var/lib/redis/redis1:/data redis'
alias rddstop='docker stop redis1 2>/dev/null; rddclean'
alias rddrestart='rddstop && sleep 1 && rddstart'
