# Authors: Rodrigo Estevao
# https://github.com/rodrigoestevao
#
# Redis related zsh aliases
#
# Adopted rd prefix for aliases and functions

alias rdstart='docker run -d -p 6379:6379 --name redis1 --restart unless-stopped -v $HOME/.local/var/lib/redis/redis1:/data redis'
alias rdstop='docker stop redis1'
alias rdrestart='rdstop && sleep 1 && rdstart'